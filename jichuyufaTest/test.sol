// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import "hardhat/console.sol";

contract HelloWeb3{
    string  _string2 = "Hello Web3 !";
   function test1() public view{

       console.log("11",_string2);
   }
    
    fallback() external {//  有传data 走这
      //  console.log(msg.value);
        //console.logBytes(msg.data);
        console.log("fallback");
        console.logBytes(msg.data);
        
    }
    
    function getBlance() public returns(uint a){
        a=address(this).balance;
    }
    uint256 public a;
    function test2(uint256 _a) view public  {//编译会报错 但是可以部署 并赋值成功
         a = _a;
    }

    function getA() public returns (uint256 ){
       return a;
    }
    receive() external payable{
        console.log(msg.value);
    }

}