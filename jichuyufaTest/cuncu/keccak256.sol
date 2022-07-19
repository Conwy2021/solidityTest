// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.4.4;
import 'hardhat/console.sol';
contract keccak256Test{

    function keccakTest() public view {
        
        bytes32 kec=keccak256('0');
        
        console.logBytes32(kec);
    }

    function keccakTest2() public view {
        
        bytes32 kec=keccak256(bytes32(0));//这个是和网上一致的 https://learnblockchain.cn/books/geth/part7/storage.html
        
        console.logBytes32(kec);
    }
}