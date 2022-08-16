pragma solidity =0.5.16;


import 'uniswap/v2-core-master/contracts/libraries/UQ112x112.sol';
import 'hardhat/console.sol';
contract uint224Test{

    using UQ112x112 for uint224;

    function test9(uint112 a,uint224 b) public {

        uint224 _a = UQ112x112.encode(a);

        console.log(_a);

        

    }


}