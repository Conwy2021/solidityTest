pragma solidity ^0.5.16;

import "openzeppelin-solidity-2.3.0/contracts/math/Math.sol";
import "openzeppelin-solidity-2.3.0/contracts/math/SafeMath.sol";
import "openzeppelin-solidity-2.3.0/contracts/token/ERC20/ERC20Detailed.sol";
import "openzeppelin-solidity-2.3.0/contracts/token/ERC20/SafeERC20.sol";
import "openzeppelin-solidity-2.3.0/contracts/utils/ReentrancyGuard.sol";

// Inheritance
import "./interfaces/IStakingRewards.sol";
import "./RewardsDistributionRecipient.sol";

contract StakingRewards is IStakingRewards, RewardsDistributionRecipient, ReentrancyGuard {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    /* ========== STATE VARIABLES ========== */

    IERC20 public rewardsToken;//奖励代币，即 UNI 代币
    IERC20 public stakingToken;//质押代币，即 LPToken
    uint256 public periodFinish = 0;//质押挖矿结束的时间，默认时为 0
    uint256 public rewardRate = 0;//挖矿速率，即每秒挖矿奖励的数量
    uint256 public rewardsDuration = 60 days;//挖矿时长，默认设置为 60 天
    uint256 public lastUpdateTime;//最近一次更新时间
    uint256 public rewardPerTokenStored;//每单位 token 奖励数量

    mapping(address => uint256) public userRewardPerTokenPaid;//用户的每单位 token 奖励数量
    mapping(address => uint256) public rewards;//用户的奖励数量 累加计算的

    uint256 private _totalSupply;//私有变量，总质押量
    mapping(address => uint256) private _balances;//私有变量，用户质押余额

    /* ========== CONSTRUCTOR ========== */

    constructor(
        address _rewardsDistribution,//工厂合约地址 父合约里的参数 限制只有工厂合约可以调用 modifier函数onlyRewardsDistribution
        address _rewardsToken,
        address _stakingToken
    ) public {
        rewardsToken = IERC20(_rewardsToken);
        stakingToken = IERC20(_stakingToken);
        rewardsDistribution = _rewardsDistribution;
    }

    /* ========== VIEWS ========== */

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }
    //从当前区块时间和挖矿结束时间两者中返回最小值
    function lastTimeRewardApplicable() public view returns (uint256) {
        return Math.min(block.timestamp, periodFinish);
    }
    //获取每单位质押代币的奖励数量（截止到当前时间点）
    function rewardPerToken() public view returns (uint256) {
        if (_totalSupply == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored.add(
                lastTimeRewardApplicable().sub(lastUpdateTime).mul(rewardRate).mul(1e18).div(_totalSupply)
            );//时间差x速率/质押代币总量 
    }
    //计算用户当前的挖矿奖励
    function earned(address account) public view returns (uint256) {
        return _balances[account].mul(rewardPerToken().sub(userRewardPerTokenPaid[account])).div(1e18).add(rewards[account]);
    }//计算出增量的每单位质押代币的挖矿奖励，再乘以用户的质押余额得到增量的总挖矿奖励，再加上之前已存储的挖矿奖励，就得到当前总的挖矿奖励
     
    function getRewardForDuration() external view returns (uint256) {
        return rewardRate.mul(rewardsDuration);//rewardRate*rewardsDuration（抵押时间60days）
    }

    /* ========== MUTATIVE FUNCTIONS ========== */

    function stakeWithPermit(uint256 amount, uint deadline, uint8 v, bytes32 r, bytes32 s) external nonReentrant updateReward(msg.sender) {
        require(amount > 0, "Cannot stake 0");
        _totalSupply = _totalSupply.add(amount);
        _balances[msg.sender] = _balances[msg.sender].add(amount);

        // permit
        IUniswapV2ERC20(address(stakingToken)).permit(msg.sender, address(this), amount, deadline, v, r, s);

        stakingToken.safeTransferFrom(msg.sender, address(this), amount);
        emit Staked(msg.sender, amount);
    }
    //质押代币
    function stake(uint256 amount) external nonReentrant updateReward(msg.sender) {
        require(amount > 0, "Cannot stake 0");
        _totalSupply = _totalSupply.add(amount);//将用户指定的质押量 amount 增加到 _totalSupply（总质押量）
        _balances[msg.sender] = _balances[msg.sender].add(amount);//将用户指定的质押量 amount 增加到_balances（用户的质押余额）
        stakingToken.safeTransferFrom(msg.sender, address(this), amount);//将代币从用户地址转入当前合约地址。
        emit Staked(msg.sender, amount);
    }
    //用来提取质押代币
    function withdraw(uint256 amount) public nonReentrant updateReward(msg.sender) {//用来提取质押代币
        require(amount > 0, "Cannot withdraw 0");
        _totalSupply = _totalSupply.sub(amount);
        _balances[msg.sender] = _balances[msg.sender].sub(amount);
        stakingToken.safeTransfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
    //领取挖矿奖励的函数
    function getReward() public nonReentrant updateReward(msg.sender) {
        uint256 reward = rewards[msg.sender];//rewards 中读取出用户有多少奖励并清零和转账给到用户：
        if (reward > 0) {
            rewards[msg.sender] = 0;
            rewardsToken.safeTransfer(msg.sender, reward);
            emit RewardPaid(msg.sender, reward);
        }
    }

    function exit() external {
        withdraw(_balances[msg.sender]);
        getReward();
    }

    /* ========== RESTRICTED FUNCTIONS ========== */
    //该函数由工厂合约触发执行，而且根据工厂合约的代码逻辑，该函数也只会被触发一次。
    function notifyRewardAmount(uint256 reward) external onlyRewardsDistribution updateReward(address(0)) {
        if (block.timestamp >= periodFinish) {//只会执行 block.timestamp >= periodFinish 的分支逻辑，将从工厂合约转过来的挖矿奖励总量除以挖矿奖励时长，得到挖矿速率 rewardRate，即每秒的挖矿数量。
            rewardRate = reward.div(rewardsDuration);//从工厂合约转过来的挖矿奖励总量除以挖矿奖励时长，得到挖矿速率 rewardRate，即每秒的挖矿数量。
            //rewardsDuration 是抵押时间 60day
        } else {//else 部分无法被调用
            uint256 remaining = periodFinish.sub(block.timestamp);
            uint256 leftover = remaining.mul(rewardRate);
            rewardRate = reward.add(leftover).div(rewardsDuration);
        }

        // Ensure the provided reward amount is not more than the balance in the contract.
        // This keeps the reward rate in the right range, preventing overflows due to
        // very high values of rewardRate in the earned and rewardsPerToken functions;
        // Reward + leftover must be less than 2^256 / 10^18 to avoid overflow.
        uint balance = rewardsToken.balanceOf(address(this));//查看下本合约UNI数量
        require(rewardRate <= balance.div(rewardsDuration), "Provided reward too high");//检查速率是否小于实际UNI数量/抵押时间

        lastUpdateTime = block.timestamp;
        periodFinish = block.timestamp.add(rewardsDuration);//periodFinish 就是在当前区块时间上加上挖矿时长，就得到了挖矿结束的时间。
        emit RewardAdded(reward);
    }

    /* ========== MODIFIERS ========== */

    modifier updateReward(address account) {//更新挖矿奖励的 modifer
        rewardPerTokenStored = rewardPerToken();//获取每单位质押代币的奖励数量（截止到当前时间点）
        lastUpdateTime = lastTimeRewardApplicable();//从当前区块时间和挖矿结束时间两者中返回最小值 挖矿结束后，lastUpdateTime 也会一直等于挖矿结束时间，这点很关键
        if (account != address(0)) {
            rewards[account] = earned(account);//计算上一阶段 获取的奖励
            userRewardPerTokenPaid[account] = rewardPerTokenStored;//记录是上一阶段 每单位质押代币的奖励数量
        }
        _;
    }//lastUpdateTime 第一次更新时 为工厂合约包奖励代币发放给抵押合约时 此时抵押合约正式开工
    //第一次抵押时 A个 rewardPerTokenStored==0 ;earned(account)==0;抵押前触发modifier 此时_balances[account]为0
    //第二次抵押时 B个 计算之前每个代币抵押的收益 rewardPerTokenStored是之前的每个代币（共A个）获取的奖励
    //  earned(account)为_balances[account]（我上次抵押的代币数量A）X rewardPerTokenStored（这里等于rewardPerTokenStored.add(0)）
    // rewardPerTokenStored 为   时间差x速率/质押代币总量 A                                                                                                                        
    //  后将收益记录放入rewards[account]; rewardPerTokenStored也更新到 userRewardPerTokenPaid[account]
    //第三次抵押时 计算之前每个代币抵押的收益 rewardPerTokenStored是之前的每个代币共（A+B个）获取的奖励
    //  earned(account)为_balances[account]（我上次抵押的代币数量A+B）X （rewardPerTokenStored（此时的reward是含有上一阶段的;PS add）-上一阶段rewardPerTokenStored)+rewards[account](这是上一阶段的奖励)
    //更新userRewardPerTokenPaid[account]
    /* ========== EVENTS ========== */

    event RewardAdded(uint256 reward);
    event Staked(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);
    event RewardPaid(address indexed user, uint256 reward);
}

interface IUniswapV2ERC20 {
    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;
}
