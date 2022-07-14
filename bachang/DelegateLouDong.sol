// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.6.0;
import "hardhat/console.sol";
contract Delegate {

  address public owner;

  constructor(address _owner) public {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    console.logBytes(msg.data);
    (bool result, bytes memory data) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
      console.logBytes(data);
    }
  }
}

contract ABITest{

    function test38() public{

      bytes memory data = abi.encodeWithSelector(bytes4(keccak256("pwn()")));//0xdd365b8b

      console.logBytes(data);
    }
}