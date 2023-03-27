pragma solidity ^0.5.16;

import "./CToken.sol";
import "./PriceOracle.sol";

contract UnitrollerAdminStorage {
    /**
    * @notice Administrator for this contract
    */
    address public admin;

    /**
    * @notice Pending administrator for this contract
    */
    address public pendingAdmin;

    /**
    * @notice Active brains of Unitroller
    */
   //   代理到那个合约来执行
    address public comptrollerImplementation;

    /**
    * @notice Pending brains of Unitroller
    */
    address public pendingComptrollerImplementation;
}

// 价格预言机
contract ComptrollerV1Storage is UnitrollerAdminStorage {

    /**
     * @notice Oracle which gives the price of any given asset
     */
    PriceOracle public oracle;

    /**
     * @notice 债务超过资产抵押率的时候可以清算多少债务
     */
    uint public closeFactorMantissa;    //  50% = 1e18 * 0.5

    /**
     * @notice 清算者在清算的时候可以多得到的奖励   清算激励 是从用户的抵押资产中扣减
     */
    uint public liquidationIncentiveMantissa;   //  1.08 =  1e8 * 1.08

    /**
     * @notice 最多有多少资产
     */
    uint public maxAssets;  //  20

    /**
     * @notice 记录用户参与的资产，不区分存款和借款！！！
     */
    mapping(address => CToken[]) public accountAssets;

}

contract ComptrollerV2Storage is ComptrollerV1Storage {
    struct Market {
        /// @notice Whether or not this market is listed
        // 资产是否上市
        bool isListed;

        /**
          * @notice 乘数代表最多的人可以在这个市场上以他们的抵押品为抵押借款。
          * 例如，0.9 允许借入抵押品价值的 90%。
          * 必须在 0 和 1 之间，并作为尾数存储。
          */
        // 抵押率
        // 100usdc 可以抵押价值90usdc的资产 用做借贷
        uint collateralFactorMantissa; // 实际 600000000000000000 0.6

        /// @notice 按市场映射“此资产中的账户”
        //  检查当前账户是否有资产
        mapping(address => bool) accountMembership;

        /// @notice 该市场是否收到 = 是否开启奖励
        bool isComped;
    }

    /**
     * @notice Official mapping of cTokens -> Market metadata
     * @dev Used e.g. to determine if a market is supported
     */
    // 每个资产对应的配置
    mapping(address => Market) public markets;


    /**
    *@notice Pause Guardian 可以暂停某些操作作为安全机制。
    *允许用户删除自己的资产的操作不能暂停。
    *清算/扣押/转移只能在全球范围内暂停，不能按市场暂停。
    */
    //  暂停
    address public pauseGuardian;
    // 不能存款
    bool public _mintGuardianPaused;
    // 不能借款
    bool public _borrowGuardianPaused;
    // 是否开启转账功能
    bool public transferGuardianPaused;
    bool public seizeGuardianPaused;    //  是否允许扣押
    // 对应资产的开关
    mapping(address => bool) public mintGuardianPaused;     //  mint 铸币权限
    mapping(address => bool) public borrowGuardianPaused;   //  借款权限
}
// v3-v6 自己的代币相关
contract ComptrollerV3Storage is ComptrollerV2Storage {
    // 市场状态
    struct CompMarketState {
        /// @notice The market's last updated compBorrowIndex or compSupplyIndex
        // 下标 使用率
        uint224 index;

        /// @notice The block number the index was last updated at
        // 区块
        uint32 block;
    }

    /// @notice 所有市场的列表
    CToken[] public allMarkets;

    /// @notice The rate at which the flywheel distributes COMP, per block
    // 每块获取多少 comp
    uint public compRate;

    /// @notice The portion of compRate that each market currently receives
    // 每个市场的获取comp 速率
    mapping(address => uint) public compSpeeds;

    /// @notice The COMP market supply state for each market
    // 每个市场的COMP市场供应状态
    mapping(address => CompMarketState) public compSupplyState;

    /// @notice The COMP market borrow state for each market
    // 每个市场的 COMP 市场借入状态
    mapping(address => CompMarketState) public compBorrowState;

    /// @notice The COMP borrow index for each market for each supplier as of the last time they accrued COMP
    // 用户存款获取comp 指数
    mapping(address => mapping(address => uint)) public compSupplierIndex;

    /// @notice The COMP borrow index for each market for each borrower as of the last time they accrued COMP
    // 用户借款获取comp 指数
    mapping(address => mapping(address => uint)) public compBorrowerIndex;

    /// @notice The COMP accrued but not yet transferred to each user
    // 每个用户未提现的COPM
    mapping(address => uint) public compAccrued;
}

contract ComptrollerV4Storage is ComptrollerV3Storage {
    /// @notice borrowCapGuardian可以将borrowCaps设置为任何市场的任何数字。降低借款上限可能会使特定市场无法借款.
    address public borrowCapGuardian;

    /// @notice 由borrowAllowed为每个cToken地址强制的借用上限。默认为零，对应于无限借款。
    mapping(address => uint) public borrowCaps; //  借款上线 0为无限
}

contract ComptrollerV5Storage is ComptrollerV4Storage {
    /// @notice 每个贡献者在每个区块中收到的 COMP 部分 挖款速率
    mapping(address => uint) public compContributorSpeeds;

    /// @notice 分配贡献者的 COMP 奖励的最后一个区块
    mapping(address => uint) public lastContributorBlock;
}

contract ComptrollerV6Storage is ComptrollerV5Storage {
    /// @notice 补偿分配到相应借贷市场的比率（每块）
    mapping(address => uint) public compBorrowSpeeds;

    /// @notice comp 分配到相应供应市场的速率（每块
    mapping(address => uint) public compSupplySpeeds;
}

contract ComptrollerV7Storage is ComptrollerV6Storage {
    /// @notice Flag indicating whether the function to fix COMP accruals has been executed (RE: proposal 62 bug)
    bool public proposal65FixExecuted;

    /// @notice Accounting storage mapping account addresses to how much COMP they owe the protocol.
    mapping(address => uint) public compReceivable;
}