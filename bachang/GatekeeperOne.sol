// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.6.0;

import '/bachang/SafeMath.sol';
import "hardhat/console.sol";
contract GatekeeperOne {

  using SafeMath for uint256;
  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);  //消息交易源为
    _;
  }

  modifier gateTwo() {
    require(gasleft().mod(8191) == 0);  //剩余gas为8191的倍数
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
      require(uint32(uint64(_gateKey)) == uint16(tx.origin), "GatekeeperOne: invalid gateThree part three");
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }

  function gateThreeTest(bytes8 _gateKey) public{
            address add=tx.origin;
            console.log(add);
            bytes20 b20 =bytes20(add);//address 转 byte20
            console.logBytes20(b20);
            uint16 a=uint16(tx.origin);
            console.log(a);

  }

  function byteadd() public {

      bytes8 b8=0x0000000000000000;
        
      bytes8 b8=b8+bytes8(0x0000000000000001);

  }
}