// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract WithDraw{

    address owner;
    mapping (address => uint256) balances;  

    event withdrawLog(address, uint256);

    function Victim() public{ owner = msg.sender; }

    function deposit(address  add) public payable { 
      balances[msg.sender] += msg.value; 
       balances[add] += msg.value; 
      
    }

    function withdraw(uint256 amount) public  {
        require(balances[msg.sender] >= amount);
        emit withdrawLog(msg.sender, amount);  
        (bool success,bytes memory data)=msg.sender.call{value:amount}("");  
        balances[msg.sender] -= amount;
    }
    function balanceOf() public returns (uint256) { 
      return balances[msg.sender]; }

    function balanceOf(address addr) public returns (uint256) { 
      return balances[addr]; }
}