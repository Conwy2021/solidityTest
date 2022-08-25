// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.4;
import 'hardhat/console.sol';
contract keccak256Test{

    function keccakTest() public view {
        
        bytes32 kec=keccak256('0');
        
        console.logBytes32(kec);//0x044852b2a670ade5407e78fb2863c51de9fcb96542a07186fe3aeda6bb8a116d
    }

    function keccakTest2(uint aa) public  {
        console.logBytes32(hex'01');//这个是16进制表示法
        console.logBytes32('0x01');//这个就是字符串转换hex 打印结果为30783031 
        bytes32 kec=keccak256(hex'00');//这个是和网上一致的 https://learnblockchain.cn/books/geth/part7/storage.html  
                                            //keccak256(0)=0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563
        
        console.logBytes32(kec);

    }

   
}