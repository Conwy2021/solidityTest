// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import 'hardhat/console.sol';
contract test {

        function test1(uint cc) public{

            uint256 a = 18;
            uint256 b = a<<cc;

            console.log(b);

        }
}
