// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import { OtherContract } from "jichuyufaTest/OtherContract.sol";

contract CallContract{
    function callSetX(address payable _Address, uint256 x) external{
        OtherContract(_Address).setX(x);
    }

    function callGetX(OtherContract _Address) external view returns(uint x){
        x = _Address.getX();
    }

    function callGetX2(address payable _Address) external view returns(uint x){
        OtherContract oc = OtherContract(_Address);
        x = oc.getX();
    }

    function setXTransferETH(address payable otherContract, uint256 x) payable external{
        OtherContract(otherContract).setX{value: msg.value}(x);
    }
}