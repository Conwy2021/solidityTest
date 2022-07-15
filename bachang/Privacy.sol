// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.6.0;

contract Privacy {

  bool public locked = true;  //bool 1个字节
  uint256 public ID = block.timestamp; //常量不占用存储
  uint8 private flattening = 10; //1字节
  uint8 private denomination = 255; //1字节
  uint16 private awkwardness = uint16(now); //2字节
  bytes32[3] private data;   //3个32字节  

  constructor(bytes32[3] memory _data) public {
    data = _data;
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }

}