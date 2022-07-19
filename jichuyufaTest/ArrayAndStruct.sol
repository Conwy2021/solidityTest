// SPDX-License-Identifier: MIT
pragma solidity ^0.5.4;

import 'hardhat/console.sol';
contract ArrayTypes {

    // 固定长度 Array
    uint[8] array1;
    bytes1[5] array2;
    address[100] array3;

    function test10() public {
        array2[0]=bytes1('a');
        uint len=array2.length;
        console.log(len);
        for(uint i=0;i<len;i++){
            bytes1 h=array2[i];
            console.logBytes1(h);
        }

    }
    // 可变长度 Array
    uint[] array4;
    bytes1[] public array5;
    address[] array6;
    bytes array7;

    function test28() public{
        uint len = array5.length;
        console.log(len);
    }

    function test33(bytes1 b1) public {
        array5.push(b1);
    }

    function test37() public{
      uint len= array5.length-1;//0.5.0版本可以这么写 0.8.0会 报错
        array5.length=len;

    }
    function test41() public {

        for(uint i=0;i<array5.length;i++){
            bytes1 h=array5[i];
            console.logBytes1(h);
        }
    }

    // 初始化可变长度 Array
    uint[] array8 = new uint[](5);
    bytes array9 = new bytes(9);
    //  给可变长度数组赋值
    function initArray() external pure returns(uint[] memory){
        uint[] memory x = new uint[](3);
        x[0] = 1;
        x[1] = 3;
        x[2] = 4;
        return(x);
    }

    // 结构体 Struct
    struct Student{
        uint256 id;
        uint256 score; 
    }
    Student student; // 初始一个student结构体
    //  给结构体赋值
    // 方法1:在函数中创建一个storage的struct引用
    function initStudent1() external{
        Student storage _student = student; // assign a copy of student
        _student.id = 11;
        _student.score = 100;
    }

     // 方法2:直接引用状态变量的struct
    function initStudent2() external{
        student.id = 1;
        student.score = 80;
    }
  
}