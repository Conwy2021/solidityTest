pragma solidity ^0.5.16;

import 'openzeppelin-solidity-2.3.0/contracts/token/ERC20/IERC20.sol';
import 'openzeppelin-solidity-2.3.0/contracts/ownership/Ownable.sol';

import './StakingRewards.sol';

contract StakingRewardsFactory is Ownable {
    // immutables
    address public rewardsToken;//用作奖励的代币，其实就是 UNI 代币
    uint public stakingRewardsGenesis;//质押挖矿开始的时间

    // the staking tokens for which the rewards contract has been deployed
    address[] public stakingTokens;//用来质押的代币数组，一般就是各交易对的 LPToken

    // info about rewards for a particular staking token
    struct StakingRewardsInfo {
        address stakingRewards;
        uint rewardAmount;
    }

    // rewards info by staking token 一个 mapping，用来保存质押代币和质押合约信息之间的映射
    mapping(address => StakingRewardsInfo) public stakingRewardsInfoByStakingToken;

    constructor(
        address _rewardsToken,
        uint _stakingRewardsGenesis
    ) Ownable() public {
        require(_stakingRewardsGenesis >= block.timestamp, 'StakingRewardsFactory::constructor: genesis too soon');

        rewardsToken = _rewardsToken;
        stakingRewardsGenesis = _stakingRewardsGenesis;
    }

    ///// permissioned functions
    //stakingToken 就是质押代币，一般为 LPToken rewardAmount 则是奖励数量
    // deploy a staking reward contract for the staking token, and store the reward amount
    // the reward will be distributed to the staking reward contract no sooner than the genesis
    function deploy(address stakingToken, uint rewardAmount) public onlyOwner {
        StakingRewardsInfo storage info = stakingRewardsInfoByStakingToken[stakingToken];
        require(info.stakingRewards == address(0), 'StakingRewardsFactory::deploy: already deployed');

        info.stakingRewards = address(new StakingRewards(/*_rewardsDistribution=*/ address(this), rewardsToken, stakingToken));
        info.rewardAmount = rewardAmount;
        stakingTokens.push(stakingToken);
    }

    ///// permissionless functions

    // call notifyRewardAmount for all staking tokens.
    function notifyRewardAmounts() public {//给每个质押合约下发uni代币
        require(stakingTokens.length > 0, 'StakingRewardsFactory::notifyRewardAmounts: called before any deploys');
        for (uint i = 0; i < stakingTokens.length; i++) {
            notifyRewardAmount(stakingTokens[i]);
        }
    }

    // notify reward amount for an individual staking token.
    // this is a fallback in case the notifyRewardAmounts costs too much gas to call for all contracts
    //调用该函数之前，其实还有一个前提条件要先完成，那就是需要先将用来挖矿奖励的 UNI 代币数量先转入该工厂合约。有个这个前提，工厂合约的该函数才能实现将 UNI 代币下发到质押合约中去。
    function notifyRewardAmount(address stakingToken) public {
        require(block.timestamp >= stakingRewardsGenesis, 'StakingRewardsFactory::notifyRewardAmount: not ready');

        StakingRewardsInfo storage info = stakingRewardsInfoByStakingToken[stakingToken];
        require(info.stakingRewards != address(0), 'StakingRewardsFactory::notifyRewardAmount: not deployed');

        if (info.rewardAmount > 0) {
            uint rewardAmount = info.rewardAmount;
            info.rewardAmount = 0;//可以避免向质押合约重复下发奖励代币

            require(
                IERC20(rewardsToken).transfer(info.stakingRewards, rewardAmount),
                'StakingRewardsFactory::notifyRewardAmount: transfer failed'
            );
            StakingRewards(info.stakingRewards).notifyRewardAmount(rewardAmount);//设置出质押挖矿的速率 UNI数量/60天 结果是每秒多少个UNI
        }
    }
}