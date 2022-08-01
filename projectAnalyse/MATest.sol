// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.11;

import 'hardhat/console.sol';

contract MATest{

    uint256 private constant MAX = ~uint256(0);//uint256 最大值的意思

    function testA() public {

        console.log(MAX);

    }

    uint256 private _tTotal;
    uint256 private _rTotal;

    function test16() public {

        _tTotal = 100000000 * 10 ** 18;
        _rTotal = (MAX - (MAX % _tTotal));
        console.log(MAX % _tTotal);//取MAX 后_tTotal位数字 例如 212%10 =2 | 25986 % 100 = 86   
        console.log(_rTotal);
    }
}