// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.0;

contract test3{//测试网地址0x00F46808a6BB415Eb932DFc54285a948ECAb755A

    string public a;
    uint b;
     constructor() {
        a="hello";
        b= 50;
    }

       // 提案的类型
    struct Proposal {
        string name10 ;   // 简称（最长32个字节）
        uint voteCount; // 得票数
    }

    uint256[] public array =[0,1,2];

    mapping(string => string) public voters;

    function test(uint num) public pure returns(uint){
       require(num>5,"error");

        return num;
    }


}