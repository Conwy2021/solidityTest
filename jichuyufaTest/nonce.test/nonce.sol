// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";
contract nonce {

   mapping(address => uint) public nonces;

   function test1() public {

      uint a= nonces[msg.sender]++;
      console.log(a);
   }

    function test2() public {

     nonces[msg.sender]= nonces[msg.sender]+1;

      console.log(nonces[msg.sender]);
   }

}   