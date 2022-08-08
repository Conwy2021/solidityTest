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
        console.log('execute2 value is -->',msg.value);
        
        try test2.pay56( add, amount)  returns (string memory data){//方法没有payable 所以value无法带到下个函数 value 没有 下个函数中的转帐自然失败 
            console.log('test2.pay56 -->',data);
        }catch{
            console.log('execute2 catch');
        }

    }

    function execute3(address TryCatchTest2add,address payable add,uint256 amount) public payable returns (bool) {
        
       
        console.log('execute3 value is -->',msg.value);
        
         (bool success, bytes memory data) = TryCatchTest2add.call{value: amount}(
            abi.encodeWithSignature("pay56(address,uint256)", add,amount)//测试调用成功
        );

        console.log('success-->',success);
        console.logBytes32(bytes32(data));//0x0000000000000000000000000000000000000000000000000000000000000020
        console.log('data-->',string(data));//data-->  ok
        string memory h =abi.decode(data, (string));
        console.log("abi.decode -->",h);
        console.logBytes(data);
        //0x
// 0000000000000000000000000000000000000000000000000000000000000020 经过测试猜想 这个段表示用32byte存储
// 0000000000000000000000000000000000000000000000000000000000000002 这个段表示存储的长度
// 6f6b000000000000000000000000000000000000000000000000000000000000 这个段表示存储的内容

    }

    function execute4(address TryCatchTest2add) public payable returns (bool) {
        
       
        console.log('execute2 value is -->',msg.value);
        
         (bool success, bytes memory data) = TryCatchTest2add.call{value: msg.value}(
            abi.encodeWithSignature("test3()")
        );

        console.log('success-->',success);
        console.log(string(data));//bytes 转string 打印为test3()
           
        

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

    function test3() public returns (string memory) {
        console.log('test3');
        // revert();
        return 'test3()';
    }

    function pay56(address payable to,uint256 amount) public payable returns ( string memory){
        console.log("pay56",msg.value);
        //to.call{value:amount};
       to.transfer(amount);

        return 'ok';
    }
}