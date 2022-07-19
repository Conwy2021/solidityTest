
// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.5.4;

contract StorageExample4 {

   uint16[] public a =  [401,402,403,405,406];

   uint256[] public b =  [401,402,403,405,406];

   //keccak256(0)=0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563
//keccak256(1)=0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6
   //web3.eth.getStorageAt("0x13b9cE1ee6b112FB896b021d2A1955ce0C184FcA","0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563");
}