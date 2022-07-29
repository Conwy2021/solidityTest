pragma solidity ^0.8.0; 

import 'hardhat/console.sol';

contract MapppingStorageTest{
    

    mapping(string => uint256) public a;

   constructor()  {
       a["u1"]=18;
       a["u2"]=19;
   }
    SlotHelp sh = new SlotHelp();
    function findMapping()  public {
        bytes32 weizhi=sh.mappingValueSlotString(0,'u1');

        console.logBytes32(weizhi);
    }

}

contract SlotHelp {

    // 获取字符串的存储起始位置
    function dataSolot(uint256 slot) public view returns (bytes32) {
        bytes memory slotEncoded  = abi.encodePacked(slot);
        console.logBytes32(bytes32(slotEncoded));
        return  keccak256(slotEncoded);
    }

    // 获取字符串 Key 的字典值存储位置
    function mappingValueSlotString(uint256 slot,string memory key ) public view returns (bytes32) {
        bytes memory slotEncoded  = abi.encodePacked(key,slot);
        console.logBytes32(bytes32(slotEncoded));
        return  keccak256(slotEncoded);
    }
}