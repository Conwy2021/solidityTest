// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.4.4;
import 'hardhat/console.sol';
contract keccak256Test{

    function keccakTest() public view {
        
        bytes32 kec=keccak256('0');
        
        console.logBytes32(kec);
    }

    function keccakTest2() public view {
        console.logBytes32(bytes32(0));
        bytes32 kec=keccak256(bytes32(0));//这个是和网上一致的 https://learnblockchain.cn/books/geth/part7/storage.html
        
        console.logBytes32(kec);

    }

    function keccakTest21(string a) public view {
        
        bytes32 kec=keccak256(a);//这个是和网上一致的 https://learnblockchain.cn/books/geth/part7/storage.html
        
        console.logBytes32(kec);// '0' ->  0x044852b2a670ade5407e78fb2863c51de9fcb96542a07186fe3aeda6bb8a116d

    }
}