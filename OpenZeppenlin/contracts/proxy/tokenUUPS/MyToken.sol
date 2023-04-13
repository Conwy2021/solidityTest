pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";


contract MyToken is Initializable, ERC20Upgradeable, OwnableUpgradeable, UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    uint public test;
    uint private pri;
    constructor() {
        _disableInitializers();//限制了逻辑合约不能初始化
    }

    function initialize() initializer public {
        __ERC20_init("MyToken", "MTK");
        __Ownable_init();
        __UUPSUpgradeable_init();
        test=1;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _authorizeUpgrade(address newImplementation)// 这个重写 限制了 只能是onlyOwner 升级自己实现地址
        internal
        onlyOwner
        override
    {}

    function test1() internal virtual{
       
    }
    
    
}


contract MyToken2 is MyToken {
    
    function initializeV2() reinitializer(2) public {
        //  __ERC20Permit_init("MyToken");
        test=2;
        //pri=1;//父类的自由私有变量无法修改
      }

    function test1() internal override(MyToken){}//重新父类是内部函数 自己重写也得是内部函数

}