// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import 'hardhat/console.sol';
interface Building {
  function isLastFloor() external view  returns (bool);//unit 貌似可以不写变量名 
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo() public returns (bool){
    Building building = Building(msg.sender);

    if (! building.isLastFloor()) {
      //floor = _floor;
      // console.log("!!!");
      top = building.isLastFloor();
    }
    
    return top;
  }
  
}