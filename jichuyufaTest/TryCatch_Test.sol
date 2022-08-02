// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import 'hardhat/console.sol';

contract TryCatchTest {

    
    
    function execute(address add) public payable returns (bool) {
        
       // try pay2(to,amount) external{ 调用自己方法 无法生效 会报错

      //  }catch{

      //  }

    TryCatchTest2 test2=TryCatchTest2(add);

        try test2.test3() {//ok

        }catch{
            console.log('execute');
        }

    }

    function execute2(address TryCatchTest2add,address payable add,uint256 amount) public payable returns (bool) {
        
        TryCatchTest2 test2=TryCatchTest2(TryCatchTest2add);

        try test2.pay56( add, amount)  returns (string memory data){
            console.log(data);
        }catch{
            console.log('execute2');
        }

    }




    function pay(address  to,uint amount) public payable{

        (bool success,bytes memory data)=to.call{value:amount}("");

        console.log(success);   

    }

    function pay2(address payable to,uint amount) public payable{

        to.transfer(amount);

    
    }
     event Log(string,address);
    fallback() external payable {
       emit Log("TryCatchTest",msg.sender);
       
    }
    
}

contract TryCatchTest2{

    function test3() public  {
        console.log('test3');
        revert();
    }

    function pay56(address payable to,uint amount) public payable returns ( string memory){
        console.log("pay56",msg.value);
        to.transfer(amount);

        return 'ok';
    }
}