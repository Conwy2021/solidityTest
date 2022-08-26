pragma solidity =0.5.16;


import 'uniswap/v2-core-master/contracts/libraries/UQ112x112.sol';
import 'hardhat/console.sol';
contract uint224Test{

    using UQ112x112 for uint224;

    function test9(uint112 a,uint112 b) public {

        uint224 w = UQ112x112.encode(a).uqdiv(b);

        console.log(w);
        bytes28 a15 =bytes28(w);
        console.logBytes28(a15);
        uint256 t17=uint256(w);
        // console.log(t17);
    
    }

    function test21(uint112 y) public {

        uint224 a=uint224(y);//4294967296=2**32
        console.log(a);//0
        
    }
     uint224 constant Q112 = 2**112;//5192296858534827628530496329220096

    // encode a uint112 as a UQ112x112
    function encode(uint112 y) public returns (uint224 z) {
        z = uint224(y) * Q112; // never overflows
        bytes28 jj= bytes28(z);
        console.logBytes28(jj);//1-5192296858534827628530496329220095 ==>
                                //0x00000000000000000000000000010000000000000000000000000000-0xffffffffffffffffffffffffffff0000000000000000000000000000
    }

    // divide a UQ112x112 by a uint112, returning a UQ112x112
    function uqdiv(uint224 x, uint112 y) public returns (uint224 z) {
        z = x / uint224(y);
        console.log(z);
    }

    function decode(uint224 x) public pure returns (uint112) {
        return uint112(x/2**112);
    }

    
}