// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract  JiSuan{

    event Log(string,uint);

    function testDiv(uint256 b,uint256 c) public{//取整   4.1 =4   4.9=4

        uint a = b/c;
        console.log(a);
       emit Log("testDiv",a);
    }

    function testAdd(uint256 b,uint256 c) public{

        uint a = b+c;
        console.log(a);
 emit Log("testAdd",a);
    }

    function testSub(uint b,uint c) public{

        uint a = b-c;
        console.log(a);
         emit Log("testSub",a);
    }

    function testMul(uint b,uint c) public{

        uint a = b*c;
        console.log(a);
         emit Log("testMul",a);
    }
    function testmod(uint b,uint c) public{//取余数

        uint a = b%c;
        console.log(a);
         emit Log("testmod",a);
    }

}