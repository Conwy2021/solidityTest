pragma solidity ^0.8.4;


import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

abstract contract inTest{
    event Log(string msg);
    function hip() public virtual{
        emit Log("Yeye");
    }

     function _foo() virtual internal;
    //function _authorizeUpgrade(address newImplementation) internal virtual;
    function _foo2() virtual public;//接口函数 子类必须重写
    //function _foo3()  public; 接口函数 必须带有关键字 virtual  子类实现的函数开放范围不能大于父类
     function hip2() public {
        emit Log("Yeye2");
    }
}

contract test is inTest{

    function hip() public virtual override{
        emit Log("suizi");
        super.hip();
    }
    // function hip2() public override { //会报错 
    //     emit Log("Yeye2");
    // }

    function _foo() virtual internal override{

    }

     function _foo2() virtual public override{}
}