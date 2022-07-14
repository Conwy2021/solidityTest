
// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.0;

contract BlockTest2{

     function test2() public view returns(bytes32 b46,uint number45){//当前blockhash 返回是0 原因未知
         number45 = block.number; // 当前区块号
         b46=blockhash(number45);   
    }
}