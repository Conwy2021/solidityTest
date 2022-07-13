pragma solidity ^0.4.24;

contract Demo {
    
    uint256 public a = 0x50;
    bytes private str = "Not secret";
    address public owner;
    mapping(address => uint256) public balanceOf;
    
    constructor() public {
        owner = msg.sender;
        balanceOf[owner] = 0x11;
    }
    
    function localVar() public pure returns (uint256){
        uint256 local = 0x10;
        return local;
    }

}