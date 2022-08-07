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
    uint256 public a24 =1;
    function test2(uint256 _a)  public view returns (uint256) {//编译会报错 偶尔可以部署（实际是无法部署的） 但是数据会出现错乱（改有返回值无返回值）
        uint256  a24 = _a;                                              //刷新浏览器第一编译时部署时因为编译报错 无deploy按钮
       return a24;                                              // 初步认为 当编译报错时 部署的是之前正确编译的代码 并不是当前代码 之前搞错了
    }

    function getA() public view returns (uint256 ){//view 可以让请求不需要gas 
       return a24;
    }
    receive() external payable{
        console.log(msg.value);
    }


    function test37() public view returns(uint256){

        uint256 a1= 256;
        for(uint256 i=0;i<100;i++){

        a1=a1+1;
        }
        return a1;

    }
    uint256 a25 = 100;
    function test38() public view returns(uint256){

         uint256 a1= 256;
          uint256 a2= 256;
            uint256 _a25=a25;

        return a25;
    }

    function setA25(uint256 _a) public {
        
        a25=_a;

    }

}