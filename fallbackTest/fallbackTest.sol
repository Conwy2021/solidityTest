// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract fallbackTest{
    string public _string = "Hello Web3!";
    
    
    function getUint() public pure returns (uint256) { 
      return 111; 
    }    

    address add=0x0498B7c793D7432Cd9dB27fb02fc9cfdBAfA1Fd3;
     function getAddress(address _add) public  returns (address,uint) { 
         
         emit Log(0,"getAddress"); 
      return (add,16); 
    }  

    function getAddress2() public  returns (uint) { 
         
         emit Log(0,"getAddress2"); 
      return 16; 
    }  


    function getAddress3() public  returns (bytes32,bytes1) { 
         
         emit Log(0,"getAddress3"); 
         bytes32  _byte32 = "MiniSolidity"; 
         bytes1  _byte = _byte32[0]; 
         bytes memory _newName = new bytes(4); //创建自定义长度的数组


      return (_byte32,_byte); 
    }  
    event Log(uint,string); 
    uint num;
    fallback() payable external{
        num=num+1;
        emit Log(num,"fallback");
    }
}