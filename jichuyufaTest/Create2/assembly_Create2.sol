// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import 'hardhat/console.sol';

contract Pair{
    address public factory; // 工厂合约地址
    address public token0; // 代币1
    address public token1; // 代币2

    constructor() public{
        factory = msg.sender;
    }

    // called once by the factory at time of deployment
    function initialize(address _token0, address _token1) external {
        require(msg.sender == factory, 'UniswapV2: FORBIDDEN'); // sufficient check
        token0 = _token0;
        token1 = _token1;
    }

    function over() public {
        selfdestruct(payable(msg.sender));
    }
}

contract PairFactory2 {
        mapping(address => mapping(address => address)) public getPair; // 通过两个代币地址查Pair地址
        address[] public allPairs; // 保存所有Pair地址

        function createPair2(address tokenA, address tokenB) external returns (address pair) {
           
            (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA); //将tokenA和tokenB按大小排序
            bytes32 salt = keccak256(abi.encodePacked(token0, token1));
            // 用create2部署新合约
            bytes memory bytecode = type(Pair).creationCode;
            console.log("createPair2 bytecode");
            console.logBytes(bytecode);
            assembly {
            pair := create2(0, add(bytecode, 32), mload(bytecode), salt)
            }
            console.log("createPair2 pair address");
            console.log(pair);
            Pair(pair).initialize(token0, token1);
           
        }

        // 提前计算pair合约地址
        function calculateAddr(address tokenA, address tokenB) public view returns(address predictedAddress){
          
            // 计算用tokenA和tokenB地址计算salt
            (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA); //将tokenA和tokenB按大小排序
            bytes32 salt = keccak256(abi.encodePacked(token0, token1));
            // 计算合约地址方法 hash()
            predictedAddress = address(uint160(uint(keccak256(abi.encodePacked(
                bytes1(0xff),//一个常量
                address(this),//创建者的地址 是这个工厂地址 每次部署会变化  同一个地址 不能两次部署 
                salt,//盐值
                keccak256(type(Pair).creationCode)//合约的代码
            )))));
            console.log("calculateAddr Address");
            console.log(predictedAddress);
            console.log("calculateAddr pair type");
            console.logBytes32(keccak256(type(Pair).creationCode));
            console.log("calculateAddr 0xff");
            console.log(uint8(bytes1(0xff)));
        }
}