// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.4;

import { Strings } from "jichuyufaTest/Library.sol";
import "hardhat/console.sol";
contract Ints{

    uint8 a ;
    uint256 b;

    function setInt8(uint8 _a) public returns(uint8){
        a=_a;
        return a;
        
    }

    function setInt256(uint256 _a) public returns(uint256){
        b=_a;
        return a;
        
    }

    function getA(uint a) public view returns (uint256){
        uint256 max =type(uint256).max;//115792089237316195423570985008687907853269984665640564039457584007913129639935
        console.log(max);
        return 2**a-1;
    }

     // 直接通过库合约名调用
    function getString2(uint256 _number) public pure returns(string memory){
        return Strings.toHexString(_number);
    }
}