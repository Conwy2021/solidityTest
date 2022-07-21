// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0; 

import 'hardhat/console.sol';
contract nowTest{

    function test() public{

        
        uint time = block.timestamp;//所以每个块都有一个时间戳（创建时） 所以时创建块的时间戳
        console.log(time);
        uint time2 = block.timestamp;
        console.log(time2);
    }
}