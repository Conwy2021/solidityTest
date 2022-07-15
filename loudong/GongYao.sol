pragma solidity ^0.4.4;
import "hardhat/console.sol";


/**验签 说明
    需求:验证消息的发送者是否为对方
    A 发送 字符串("abc") 给 B 附待一个签名数据

    B 进行验签 
    1.从签名数据中提取 r s v 值
    2.将字符串abc进行keccak256 算下 得到0x4e03657aea45a94fc7d47ba826c8d667c0d1e6e33a64a036ec44f58fa12d6c45
    3.已知 r s v 和 keccak256("abc")  根据ecrecover()验签函数 可得A公钥
    4.对比放送方和计算的结果 一致 证明消息是对方发送的 验签完成

    ecrecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) returns (address) 利用椭圆曲线签名恢复与公钥相关的地址，错误返回零值。
    uint8 wrongV = 17; // should normally be 27 or 28  这里的意思是v1的值 要求是27 或者 28 但是函数中已经加了27  也就是说除了27 28 都会返回0地址公钥 
**/

contract GongYao{

    //公匙：0x60320b8a71bc314404ef7d194ad8cac0bee1e331
  //sha3(msg): 0x4e03657aea45a94fc7d47ba826c8d667c0d1e6e33a64a036ec44f58fa12d6c45 (web3.sha3("abc");) //keccak256等同于sha3。
  //签名后的数据：0xf4128988cbe7df8315440adde412a8955f7f5ff9a5468a791433727f82717a6753bd71882079522207060b681fbd3f5623ee7ed66e33fc8e581f442acbcf6ab800

  //验签数据入口函数
  function decode()  returns (address){
    bytes memory signedString =hex"f4128988cbe7df8315440adde412a8955f7f5ff9a5468a791433727f82717a6753bd71882079522207060b681fbd3f5623ee7ed66e33fc8e581f442acbcf6ab800";

    bytes32  r = bytesToBytes32(slice(signedString, 0, 32));
    bytes32  s = bytesToBytes32(slice(signedString, 32, 32));
    byte  v = slice(signedString, 64, 1)[0];
    console.logBytes32(r);//0xf4128988cbe7df8315440adde412a8955f7f5ff9a5468a791433727f82717a67
    console.logBytes32(s);//0x53bd71882079522207060b681fbd3f5623ee7ed66e33fc8e581f442acbcf6ab8
    console.logBytes32(v);//0x0000000000000000000000000000000000000000000000000000000000000000
    console.logBytes1(v);//打印类型不同 0x00
    return ecrecoverDecode(r, s, v);
  }

  //将原始数据按段切割出来指定长度
  function slice(bytes memory data, uint start, uint len) returns (bytes){
    bytes memory b = new bytes(len);

    for(uint i = 0; i < len; i++){
      b[i] = data[i + start];
    }

    return b;
  }

  //使用ecrecover恢复公匙
  function ecrecoverDecode  (bytes32 r, bytes32 s, byte v1) returns (address addr){
     uint8 v = uint8(v1) + 27;
     addr = ecrecover(hex"4e03657aea45a94fc7d47ba826c8d667c0d1e6e33a64a036ec44f58fa12d6c45", v, r, s);

  }

  //bytes转换为bytes32
  function bytesToBytes32(bytes memory source) returns (bytes32 result) {
    assembly {
        result := mload(add(source, 32))
    }
  }


}