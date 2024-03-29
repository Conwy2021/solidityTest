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
  uint num  =  0 ;
  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount; //这里存在溢出问题  不然重入减去为负值 报错的话 也无法超额提款
      console.log(balances[msg.sender]);
      num++;
      console.log(num);
    }
  }

  receive() external payable {}
}
