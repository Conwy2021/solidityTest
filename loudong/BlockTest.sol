pragma solidity ^0.4.22;
import "hardhat/console.sol";

contract BlockTest{

    function test6() public view returns(bytes32 _blockHash,bytes32 _blockHash2,uint number){
         number = block.number; // 当前区块号
         console.log("number",number);
        uint diff = block.difficulty; // 
         console.log("diff",diff);
        uint time = block.timestamp; // 
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
        uint  _now = now;//时间戳
         console.log("now",now);

         _blockHash=blockhash(number);//当前区块的hash 如果想知道前一个就减去1
        console.log("---_blockHash----");
         console.logBytes32(_blockHash);
          _blockHash2=blockhash(number-1);//当前区块的hash 如果想知道前一个就减去1
        console.log("---_blockHash2----");
         console.logBytes32(_blockHash2);

    }


    function test2(uint b) public view returns(bytes32,uint,bytes32,bytes32){//当前blockhash 返回是0 原因未知
        console.log(block.number);
        uint a =block.number;
        console.logBytes32(blockhash(block.number));
        bytes32 a47=blockhash(a);
        console.logBytes32(blockhash(a));
        bytes32 b49 =blockhash(b);
        console.logBytes32(blockhash(b));
        return (blockhash(block.number),a,a47,b49);
    }



}