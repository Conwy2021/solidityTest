// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "@openzeppelin/contracts/governance/TimelockController.sol";

contract TimeLock is TimelockController {
    // minDelay is how long you have to wait before executing
    // proposers is the list of addresses that can propose
    // executors is the list of addresses that can execute
    constructor(
        uint256 minDelay,//执行提案前 需要等待的是时间 按秒算的 
        address[] memory proposers,
        address[] memory executors
    ) TimelockController(minDelay, proposers, executors,msg.sender) {}
}
