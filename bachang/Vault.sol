// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.6.0;

contract Vault {
  bool public locked;
  bytes32 private password;

  constructor(bytes32 _password) public {
    locked = true;
    password = _password;//0x1234567812345678123456781234567812345678123456781234567812345678
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }

  //在console 中 执行eth.getStorageAt("0x43A6c041C7BfeC90892EdE78629F74ACCaaf1935",1); 可以获取到password的值. 第一个参数表示 合约部署地址,第二个参数是全局第几个变量.(0开始)
}