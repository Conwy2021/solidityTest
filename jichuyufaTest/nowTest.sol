// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0; 

import 'hardhat/console.sol';
import 'jichuyufaTest/test.sol';
contract nowTest{
        HelloWeb3 public hello;
        constructor() public{
        hello=new HelloWeb3();
    }
}