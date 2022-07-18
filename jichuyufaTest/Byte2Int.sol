// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract Byte2Int{

    function BytetoInt() public {
        string memory a ="1a";
        bytes memory b = bytes(a);//string-->变长字节数组
        console.logBytes(b);//0x3161 


        bytes2 b8=0x3161;// 0x3161 =="1a"  string 转bytes  a 是 61  1是31
        uint u9=uint16(b8);
        console.log(u9);
        uint16 u11=uint16(b8);//0x3161  转换为10 进制 为12621
        console.log(u11);
        uint64 int64test=18446744073709551615;//最大值18446744073709551615  uint24 最大为16777215
        console.log(int64test);

        bytes8 bytes8Test =bytes8(int64test);
        console.logBytes8(bytes8Test);

        uint24 uint24test= 16777215;
        console.log(uint24test);
        bytes3 bytes3Test =bytes3(uint24test);
        console.logBytes3(bytes3Test);//0xffffff

        bytes8 bytes8Test2 = bytes3(uint24test);//uint24 转换为bytes3 放到bytes8 里  是放在高位进行填充存储的
        console.logBytes8(bytes8Test2);//0xffffff0000000000
    }

    function toBytes(uint256  x) public returns (bytes memory b) {
    b = new bytes(32);
    assembly { mstore(add(b, 32), x) }
    console.logBytes(b);
    bytes8 b8 =bytes8(b);
    console.logBytes8(b8);//截取前面8位 这里也能说明 高byte转低byte存储 是高位存储
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
   
    function byteToInt() public {

        bytes8 test52=0x1234567812345670;
        uint64 test64 = uint64(test52);
        console.log(test64);//1311768465173141104
        uint32 test55= uint32(test64);
        bytes4 test56 = bytes4(test52); //uint32 和bytes32 其实是一个意思就是存储类型不同 
        console.log("------test56------");
        console.logBytes4(test56);//0x12345678 bytes 是高位截取
        console.log(test55);//305419888  uint 是低位截取  这个数值用16进制为0x12345670
        uint16 test57=uint16(test64); 
        console.log(test57);//22128  uint 是低位截取  这个数值用16进制为0x5670


    }

}