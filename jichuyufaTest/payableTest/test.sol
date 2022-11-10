// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


import './testInterface.sol';

contract test{
    
    testInterface tsContract;

    function init(address add) public {

         tsContract = testInterface(add);
    }


    function testONE(uint256 _ammount,uint256 _value) external payable{
        tsContract.saleMint{gas: 1000000, value: 1 ether}(_ammount);
    }


}