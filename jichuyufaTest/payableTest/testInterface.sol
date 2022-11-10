
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";
contract testInterface{
    function saleMint(uint256 _ammount) external payable {

        console.log("11",msg.value);//必须带前面的string格式字符 不然一直pending 
        console.log("22",msg.sender);

    }
}