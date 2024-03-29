// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// delegatecall和call类似，都是低级函数
// call: B call C, 语境为 C (msg.sender = B, C中的状态变量受影响)
// delegatecall: B delegatecall C, 语境为B (msg.sender = A, B中的状态变量受影响)
// 注意B和C的数据存储布局必须相同！变量类型、声明的前后顺序要相同，不然会搞砸合约。
import 'hardhat/console.sol';
// 被调用的合约C
contract C {
    uint public num;
    address public sender;
    uint public num3;
    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        address add = address(this);// 使用delegatecall返回值 为调用地址
        console.log(add);
    }
}

// 发起delegatecall的合约B
contract B {
    uint public num;
    address public sender;
    uint public num2;
    // 通过call来调用C的setVars()函数，将改变合约C里的状态变量
    function callSetVars(address _addr, uint _num) external payable{
        // call setVars()
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
    // 通过delegatecall来调用C的setVars()函数，将改变合约B里的状态变量
    function delegatecallSetVars(address _addr, uint _num) external payable{
        // delegatecall setVars()
        (bool success, bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}