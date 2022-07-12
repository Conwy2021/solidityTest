// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "hardhat/console.sol";

contract Mapping{

    mapping(uint => address) public idToAddress; // id映射到地址
    mapping(address => address) public swapPair; // 币对的映射，地址到地址
    mapping (address => mapping (address => uint256)) public allowed; //类似二维数组
    // 规则1. _KeyType不能是自定义的 下面这个例子会报错
    // 我们定义一个结构体 Struct
    // struct Student{
    //    uint256 id;
    //    uint256 score; 
    //}
    // mapping(Struct => uint) public testVar;

    function writeMap (uint _Key, address _Value) public{
        idToAddress[_Key] = _Value;
    }

    function getMap(uint a) public view returns(address b) {

             b =idToAddress[a];
    }

    function writeMap2(address a,address b,uint256 c) public{

        allowed[a][b]=c;
        
    }

    function getMap2(address a,address b)public view returns(uint c){
        c=allowed[a][b];
    }
    
    function consoleTest(address a,address c) public {
        mapping (address => uint256) storage b= allowed[a];
        uint256 d=b[c];
        console.log("hello",d);
    }
}