// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract HelloWeb3{
    string public _string = "Hello Web3!";
    
    
    function getUint() public pure returns (uint256) { 
      return 111; 
    }    

    address add;
     function getAddress(address _add) public  returns (address) { 
         add=_add;
         
      return _add; 
    }  
    event Log(int,string);
    fallback() external{
        emit Log(1,"fallback");
    }
}