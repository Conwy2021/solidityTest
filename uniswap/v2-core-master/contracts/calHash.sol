pragma solidity =0.5.16;
import './UniswapV2Pair.sol';
// 根据不同环境 修改 lib 中 pair 的hex  坑啊
contract CalHash {
    function getInitHash() public pure returns(bytes32){
        bytes memory bytecode = type(UniswapV2Pair).creationCode;
        return keccak256(abi.encodePacked(bytecode));
    }
}