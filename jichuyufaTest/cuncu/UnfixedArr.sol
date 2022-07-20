pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

contract UnfixedArr {
    
    bool public frozen = false;
    
    function wrongArr(bytes[] elements) public {//输入 ["0x0000000000000000000000000000000000000000000000000000000000000001"] 
        bytes[1] storage arr;//未初始化的本地存储变量可以指向合约中的其他存储变量
        arr[0] = elements[0];
    }
}