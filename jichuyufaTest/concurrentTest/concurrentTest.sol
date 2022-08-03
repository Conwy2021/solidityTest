// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.4;

contract Test{

    uint256 public a  = 1;

    function test1() public{

        require(a>0,'');
        a=a-1;


    } 

    function setA(uint256 _a) public{
        a=_a;
    }

}