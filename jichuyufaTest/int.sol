// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.4;

import { Strings } from "contracts/Library.sol";
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

    function getA() public pure returns (uint256){

        return 2**8;
    }

     // 直接通过库合约名调用
    function getString2(uint256 _number) public pure returns(string memory){
        return Strings.toHexString(_number);
    }
}