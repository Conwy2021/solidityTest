// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// 3种方法发送ETH
// transfer: 2300 gas, revert
// send: 2300 gas, return bool
// call: all gas, return (bool, data)

error SendFailed(); // 用send发送ETH失败error
error CallFailed(); // 用call发送ETH失败error

contract SendETH {
    // 构造函数，payable使得部署的时候可以转eth进去
    constructor() payable{}
    // receive方法，接收eth时被触发
    //receive() external payable{}

    // 用transfer()发送ETH
    function transferETH(address payable _to, uint256 amount) external payable{
       _to.transfer(amount);
    }

    // send()发送ETH
    function sendETH(address payable _to, uint256 amount) external payable{
        // 处理下send的返回值，如果失败，revert交易并发送error
        bool success = _to.send(amount); 
        if(!success){
            revert SendFailed();
        }
    }

    // call()发送ETH
    function callETH(address payable _to, uint256 amount) external payable{//payable 在没有receive 或者fallback 函数的合约中 也是接收钱的 他的逻辑是把钱给这个函数 不是给这个合约再给这个函数
        // 处理下call的返回值，如果失败，revert交易并发送error
        (bool success,bytes memory data) = _to.call{value: amount}("");//call 返回两个参数
        emit Log("bool is",success);
        if(!success){
            revert CallFailed();
        }
    }

     // 返回合约ETH余额
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }

    event Log(string,bool);
}

