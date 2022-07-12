pragma solidity ^0.4.22;

import "hardhat/console.sol";

contract Auction {
    address public currentLeader;
    uint256 public highestBid;
    
    event show(address addr, uint256 _value);
    
    function showtoken() public view returns(uint256){
        return address(this).balance;
    }
    
    function bid() public payable {
        require(msg.value > highestBid,"11");
        require(currentLeader.send(highestBid));
        currentLeader = msg.sender;
        highestBid = msg.value;
        console.log(highestBid);
    }

}