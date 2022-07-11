// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ABIEncode{
    uint x = 10;
    address addr = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    string name = "0xAA";
    uint[2] array = [5, 6]; 

    //将给定参数利用ABI规则编码
    function encode() public view returns(bytes memory result) {
        result = abi.encode(x, addr, name, array);
    }
    //将给定参数根据其所需最低空间编码。它类似 abi.encode，但是会把其中填充的很多0省略。
    function encodePacked() public view returns(bytes memory result) {
        result = abi.encodePacked(x, addr, name, array);
    }
    //与abi.encode功能类似，只不过第一个参数为函数签名，比如"foo(uint256,address)"。当调用其他合约的时候可以使用。
    function encodeWithSignature() public view returns(bytes memory result) {
        result = abi.encodeWithSignature("foo(uint256,address,string,uint256[2])", x, addr, name, array);
    }
    //与abi.encodeWithSignature功能类似，只不过第一个参数为函数选择器，为函数签名Keccak哈希的前4个字节。
    function encodeWithSelector() public view returns(bytes memory result) {
        result = abi.encodeWithSelector(bytes4(keccak256("foo(uint256,address,string,uint256[2])")), x, addr, name, array);
    }


    function decode(bytes memory data) public pure returns(uint dx, address daddr, string memory dname, uint[2] memory darray) {
        (dx, daddr, dname, darray) = abi.decode(data, (uint, address, string, uint[2]));
    }

   
}