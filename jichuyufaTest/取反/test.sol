// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import 'hardhat/console.sol';
contract test {

        function test1(int8 cc) public view{

           
            int8 b = ~cc;

            console.logInt(b);

        }

        function test2(uint8 cc) public view{

           
            uint8 b = ~cc;

            console.log(b);

        }
}
