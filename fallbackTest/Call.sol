// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Call{
    // 定义Response事件，输出call返回的结果success和data
    event Response(bool success, bytes data);

    function callSetX(address payable _addr, uint256 x) public payable {
        // call setX()，同时可以发送ETH
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("setX(uint256)", x)
        );

        emit Response(success, data); //释放事件
    }

    function callGetX(address _addr) external returns(uint256){
        // call getX()
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("getX()")
        );

        emit Response(success, data); //释放事件
        return abi.decode(data, (uint256));//这里返回output会显示
    }

    function callNonExist(address _addr) external{
        // call getX()
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("foo(uint256)")
        );

        emit Response(success, data); //释放事件
    }

    function callHello(address _addr) external{
        // call getAddress()
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("getAddress()",_addr)
        );
        emit Response(success, data); //释放事件
    }

}