// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ByteTest{

         bytes32 public _byte32 = "MiniSolidity"; 
         bytes1 public _byte = _byte32[0]; 
         bytes public  _newName = new bytes(3);//创建自定义长度的数组
         // 修改内容
        function setBtContent() public {
        
            _newName[0] = 0x11 ;
             _newName[1] = "a" ;//a=61 16进制 10进制97 
        
    }
           bytes1 public a= _newName[0];
        bytes1 public _byte1= "a";
        bytes1 public _byte2= 0x97;
        bytes2 public b = 0x9788;//定长 数组 不可改变
        bytes1 public c=b[0]; 
       
        uint public a22=0x11;//可以16进制
}