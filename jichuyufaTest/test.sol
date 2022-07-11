// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract HelloWeb3{
    string public _string2 = "Hello Web3 !";
   function test1() public view{

       console.log("11",_string2);
   }
    
}