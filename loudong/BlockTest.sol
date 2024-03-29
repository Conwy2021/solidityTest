// SPDX-License-Identifier: MITs
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract BlockTest{

    function test6() public payable returns(bytes32 _blockHash,bytes32 _blockHash2,uint number){
         number = block.number; // 当前区块号
         console.log("number",number);
        uint diff = block.difficulty; // 
         console.log("diff",diff);
        uint time = block.timestamp; //  目前区块时间戳  time 1660639670
         console.log("time",time);
        uint gas = block.gaslimit;
         console.log("gas",gas);
        

        address _coinbase =block.coinbase;//挖出当前区块的矿工地址
         console.log("_coinbase",_coinbase);
        uint  _gas = gasleft();//消耗gas
        console.log("_gas",_gas);
        bytes4  _gis = msg.sig;//calldata 的前 4 字节（也就是函数标识符）
        console.log("--_gis--");
         console.logBytes4(_gis);
        uint  _value  = msg.value;
         console.log("_value",_value);
        uint  _gasPrice = tx.gasprice;
         console.log("_gasPrice",_gasPrice);
        address  _orign = tx.origin;//交易发起者（完全的调用链） a->b->c 则是a
         console.log("_orign",_orign);
        uint  _now = block.timestamp;//时间戳
         console.log("now",_now);

         _blockHash=blockhash(number);//当前区块的hash 如果想知道前一个就减去1
        console.log("---_blockHash----");
         console.logBytes32(_blockHash);
          _blockHash2=blockhash(number-1);//当前区块的hash 如果想知道前一个就减去1
        console.log("---_blockHash2----");
         console.logBytes32(_blockHash2);

    }

     event Log(string,uint256);
    function test2() public  returns(bytes32 b46,uint number45){//当前blockhash 返回是0 以太坊黄皮书有说明 也有可能因为当前区块会回滚之类的
         number45 = block.number; // 当前区块号
         b46=blockhash(number45);
         uint256 chainId =block.chainid;//链id 
        console.log("chainId is ",chainId);
        emit Log("chainId is ",chainId);//rinkeby 是 4 ropsten 是 3 这个id 是唯一的 chainIdList 清单 https://chainlist.org/zh
       


    }

    function test55() public {
        uint time = block.timestamp; //  目前区块时间戳  time 1660639670
         console.log("time",time);
         uint32 time2 =uint32(uint(4294967296));
         console.log('uint32T',time2);
         uint32 blockTimestamp = uint32(uint(4294967297) % 2**32);
        console.log('blockTimestamp',blockTimestamp);
    }

}