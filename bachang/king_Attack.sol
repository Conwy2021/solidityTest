// SPDX-License-Identifier: MIT
pragma solidity ^0.4.0;

contract Attack{

        event Init(string,address);
     constructor() public{
         emit Init("Init ok",msg.sender);
     }

    function attackGO(address  add) public payable{
        //add.transfer(msg.value); 
        add.call.value(msg.value)();

    }
        event Log(string,address);
    function() external payable{
       emit Log("attack in fallback1",msg.sender);
    }
}