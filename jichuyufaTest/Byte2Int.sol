// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract Byte2Int{

    function BytetoInt() public {
        bytes2 b8=0x3161;// 0x3161 =="a1"  string 转bytes
        uint u9=uint16(b8);
        console.log(u9);
        uint16 u11=uint16(b8);//0x3161  转换为10 进制 为12621
        console.log(u11);

    }

    function toBytes(uint256  x) public returns (bytes memory b) {
    b = new bytes(32);
    assembly { mstore(add(b, 32), x) }
    console.logBytes(b);
    bytes8 b8 =bytes8(b);
    console.logBytes8(b8);//截取前面8位
    }   
    function toBytes2(uint64  x) public returns (bytes memory c) {// 最大 18446744073709551615
        bytes8 b = bytes8(x);
        c = new bytes(8);
        for (uint i=0; i < 8; i++) {
            c[i] = b[i];
        }
         console.logBytes(c);
         console.logBytes8(b);
    } 
   


}