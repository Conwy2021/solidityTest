// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Call{
    // 定义Response事件，输出call返回的结果success和data
    event aa(bool success, bytes data);
    event bb(string,string);
    function callSetX(address payable _addr, uint256 x) public payable {
        // call setX()，同时可以发送ETH
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("setX(uint256)", x)
        );

        emit aa(success, data); //释放事件
    }

    function callGetX(address _addr) external returns(uint256){
        // call getX()
        //emit bb("19","19");
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("getX()")
        );
        //emit bb("23","23");
        emit aa(success, data); //释放事件
        return abi.decode(data, (uint256));
    }

    function callNonExist(address _addr) external{
        // call getX()
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("foo(uint256)")
        );

        emit aa(success, data); //释放事件
    }
}