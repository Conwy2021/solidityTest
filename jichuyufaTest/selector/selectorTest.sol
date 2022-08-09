// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.4;

import "hardhat/console.sol";
contract selectorTest{

        function test6() public {

            bytes4 h =test1.test11.selector;

            console.logBytes4(h);//0xfa8b8ea1
        }

}

contract test1{

    function test11() public {}


     function mintSelector(string memory func) external pure returns(bytes4 mSelector){
         bytes memory b = bytes(func);
        return bytes4(keccak256(b));//0xfa8b8ea1
    }
}