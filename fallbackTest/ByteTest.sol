// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";
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
        bytes public  a27;
         function bytesadd() public{
              a27=bytes("abc");
              uint len = a27.length;
              bytes1 b32 =a27[0];
              console.log("bytesadd--->",string(a27));
              console.logBytes(a27);
              console.logBytes1(b32);
              console.log("length is ",len);
              a27.push("b");//添加参数
              uint len2 = a27.length;
              console.log("length later is ",len2);
              console.log("bytesadd--later->",string(a27));
         }
            event Log(bytes1);
         function byte43test() public view returns(bytes1){// 对比1
             bytes1[2] memory a44 =[bytes1(0xaa),0xab];
             bytes1 b45 =a44[1];
            console.logBytes1(b45);
            return b45;
         }

         function byte50test() public view returns(bytes1 b45){// 对比2 这个时候返回b45 是空值 原因未知
             bytes1[2] memory a44 =[bytes1(0xaa),0xab];
             bytes1 b45 =a44[1];
             console.logBytes1(b45);
         }

}