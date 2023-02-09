// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0) (token/ERC20/extensions/ERC20Votes.sol)

pragma solidity ^0.8.0;

import 'hardhat/console.sol';

contract tt{

    uint256 _i;

    function test(uint256 _length) public {

    while (_i < _length) {
        
        console.log('while-->',_length);
      

        
        if (--_length > 0) {
           console.log('if-->',_length);
        }
       
        continue;
      }

      _i++;
    }
    
      uint8 [5]arr=[1,2,3,4,5];
    function prefieTest()public view returns (uint8){
        uint8 index=0;
        uint8 a = arr[++index];
        console.log(index);
        return ++index;
    }
    function postfieTest()public view returns (uint8){
        uint8 index=0;
        uint8 a = arr[index++];
        console.log(index);
        return index++;
    }


}