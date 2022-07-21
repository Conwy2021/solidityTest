// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.4.4;
import 'hardhat/console.sol';
contract keccak256Test{

    function keccakTest() public view {
        
        bytes32 kec=keccak256('0');
        
        console.logBytes32(kec);//0x044852b2a670ade5407e78fb2863c51de9fcb96542a07186fe3aeda6bb8a116d
    }

    function keccakTest2(uint aa) public view {
        console.logBytes32(bytes32(aa));
        bytes32 kec=keccak256(bytes32(aa));//这个是和网上一致的 https://learnblockchain.cn/books/geth/part7/storage.html  
                                            //keccak256(0)=0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563
        
        console.logBytes32(kec);

    }

    function keccakTest21(string a) public view {
        
        bytes32 kec=keccak256(a);
        
        console.logBytes32(kec);// '0' ->  0x044852b2a670ade5407e78fb2863c51de9fcb96542a07186fe3aeda6bb8a116d
                                // 'a' -> 0x3ac225168df54212a25c1c01fd35bebfea408fdac2e31ddd6f80a4bbf9a5f1cb
    }

    function keccakTest30(uint aa) public view {
        console.logBytes1(bytes1(aa));
        bytes32 kec=keccak256(bytes1(aa));
        
        console.logBytes32(kec);

    }

    function keccakTest38() public {

        for(uint8 i=0;i<2**16;i++){
           bytes32 kec= keccak256(i);
           if(kec==0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365){
               console.log(uint(i));
               break;
           }

        }
    }
}