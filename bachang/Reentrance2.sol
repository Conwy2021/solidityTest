// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import 'hardhat/console.sol';
import 'bachang/SafeMath.sol';

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }
  
    function withdraw() external {
        uint256 balance = balanceOf(msg.sender); // 获取余额
        require(balance > 0, "Insufficient balance");
        // 转账 ether !!! 可能激活恶意合约的fallback/receive函数，有重入风险！
        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Failed to send Ether");
        // 更新余额
        balances[msg.sender] = 0;
    }

  receive() external payable {}
}
