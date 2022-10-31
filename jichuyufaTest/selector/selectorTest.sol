// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.4;

import "./IERC165.sol";
import "hardhat/console.sol";
contract selectorTest{

        function test6() public {

            bytes4 h =test1.test11.selector;

            console.logBytes4(h);//0xfa8b8ea1
        }

}

interface IselectorTest{

    function test6() external;//interfaceId 0x6f3babc4
}

contract test1 is IERC165{

    function test11() public {}


     function mintSelector(string memory func) external pure returns(bytes4 mSelector){
         bytes memory b = bytes(func);
        return bytes4(keccak256(b));
    }

    function test26(bytes4 _interfaceId) public {

       bytes4 result =type(IselectorTest).interfaceId;//type 后面必须是接口类 interfaceId 是个属性值  计算这个接口的一个值 具体算法在笔记中
       console.logBytes4(result);
    }

     function supportsInterface(bytes4 interfaceId)//0x01ffc9a7 这个是165 的interfaceId 接口签名为supportsInterface(bytes4)
        external
        pure
        override
        returns (bool)
    {
        return  interfaceId == type(IERC165).interfaceId;
            
    }
}