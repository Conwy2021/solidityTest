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

        //地址数组 ["0xb4D30Cac5124b46C2Df0CF3e3e1Be05f42119033","0x0e823fFE018727585EaF5Bc769Fa80472F76C3d7"]
         bytes4[5] public  a25 = [bytes4(0x67676767),0x68686767,0x79686767,0x75686767];
         uint[5] public fixedArr = [1,2,3,4,5];
}