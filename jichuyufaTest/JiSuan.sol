// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract  JiSuan{

    function testDiv(uint b,uint c) public{

        uint a = b/c;
        console.log(a);
    }

    function testAdd(uint b,uint c) public{

        uint a = b+c;
        console.log(a);

    }

    function testSub(uint b,uint c) public{

        uint a = b-c;
        console.log(a);
    }

    function testMul(uint b,uint c) public{

        uint a = b*c;
        console.log(a);
    }
    function testmod(uint b,uint c) public{//取余数

        uint a = b%c;
        console.log(a);
    }

}