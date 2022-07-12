pragma solidity ^0.4.22;
import "hardhat/console.sol";

contract YiChuTest{
        uint8 b = 0;
     function test() public  {
         uint8 a=255;
        
        b=b+1;
        console.log(uint(b));
        uint c = a+b;
        console.log(c);

     }

}