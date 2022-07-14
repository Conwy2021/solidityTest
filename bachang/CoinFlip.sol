pragma solidity ^0.6.0;

import '/bachang/SafeMath.sol';
import "hardhat/console.sol";
contract CoinFlip {

  using SafeMath for uint256;
  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968; //2^255

  constructor() public {  
    consecutiveWins = 0;
  }

  function flip(bool _guess) public returns (bool) { //返回
    uint256 blockValue = uint256(blockhash(block.number.sub(1))); //把blockvalue随机数设置为区块号-1然后进行hash 
    
    console.logBytes32(blockhash(block.number.sub(1)));
    console.log(blockValue);                                 //blockhash 返回类型是bytes32 转为unit256         
    if (lastHash == blockValue) { //上一次的值和这一次的值相等，防止循环 lastHash初始值 为0
      revert();
    }
    lastHash = blockValue;//赋值

    uint256 coinFlip = blockValue.div(FACTOR);   //blockvalue 除以 factor
    bool side = coinFlip == 1 ? true : false;  //如果等于1 则返回true 很显然 false的概率很大

    if (side == _guess) { //猜对的话  wins+1返回true 错的话 清零 返回false
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
}