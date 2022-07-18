// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.6.0;

contract LibraryContract1 {

  // stores a timestamp 
  uint storedTime;  

  function setTime(uint _time) public {
    storedTime = _time;
  }
}