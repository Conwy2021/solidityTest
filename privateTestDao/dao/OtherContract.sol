// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract OtherContract {
    uint256 private _x = 0; // 状态变量x
    // 收到eth事件，记录amount和gas
    event Log(uint amount, uint gas);
    
   fallback() external payable{
       console.log("---OtherContract---");
       console.logBytes(msg.data);
   }
    
    // 返回合约ETH余额
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }

    // 可以调整状态变量_x的函数，并且可以往合约转ETH (payable)
    function setX(uint256 x) external payable{
       //assert(false);//0.5.4 版本 传过来的gas 不会返回传过来的 
        _x = x;
        // 如果转入ETH，则释放Log事件
        if(msg.value > 0){
            emit Log(msg.value, gasleft());
        }
    }

    // 读取x
    function getX() external view returns(uint x){
        x = _x;
    }

}


