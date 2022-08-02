// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract Byte2String2Byte{
     bytes10 b10 = 0x68656c6c6f776f726c64;   //helloworld  定长数组 貌似 定长数组 可以用16进制表示 
    bytes b7="0x68656c6c6f776f726c64";
    function test() public {

        string memory a ="1a";
        bytes memory b = bytes(a);//string-->变长字节数组
        console.logBytes(b);//0x3161 
        string memory c =string(b);//变长字节数组-->string 3
        
        console.log(c);
        bytes memory d =bytes("asfsfs");
    }

    function test2() public {

        bytes32 a =bytes32('ok');
         console.logBytes32(a);//0x6f6b000000000000000000000000000000000000000000000000000000000000
        uint256 b =uint256(a); 
        console.log(b);//50395778828673856232704394613690264826947323190583279542502573679469393870848
        string memory c =string(bytes('ok'));
        console.log(c);//ok
    }

    //1. 定长字节数组-->变长字节数组  （拷贝）
    //bytes bs10 = b10;  // ERROR
    bytes public bs10 = new bytes(b10.length);
    function fixedBytesToBytes() public{
        // （拷贝）
        for (uint i = 0; i< b10.length; i++){
            bs10[i] = b10[i];
        }

    }
    //4. 定长字节数组-->string
    function FiexBytesToString() public {
        //string tmp = string(b10);  // ERROR。不可以直接转换，可以通过1.和3.间接转换
    }

    function stringTOByte() public {

        bytes4 bytestest36 ="1a";

        console.logBytes4(bytestest36);//0x31610000
    }

}