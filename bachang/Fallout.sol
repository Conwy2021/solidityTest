// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.6.0;

import '/bachang/SafeMath.sol';

contract Fallout {
  
  using SafeMath for uint256;
  mapping (address => uint) allocations;
  address payable public owner;

  /* constructor */
  function Fal1out() public payable {       //坑爹构造器，有个1（一），普通函数 构造函数使用错误  不是普通方法
    owner = msg.sender;
    allocations[owner] = msg.value;
  }

  modifier onlyOwner {
	        require(
	            msg.sender == owner,
	            "caller is not the owner"
	        );
	        _;
	    }

  function allocate() public payable { //存入值交易和总值
    allocations[msg.sender] = allocations[msg.sender].add(msg.value);
  }

  function sendAllocation(address payable allocator) public { //确认交易值要大于0
    require(allocations[allocator] > 0);
    allocator.transfer(allocations[allocator]);            //取回交易的值
  }

  function collectAllocations() public onlyOwner {
    msg.sender.transfer(address(this).balance);    //合约拥有者为攻击者时，取回当前合约的所有值
  }

  function allocatorBalance(address allocator) public view returns (uint) { //返回交易者
    return allocations[allocator];
  }
}