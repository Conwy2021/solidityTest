const Web3 = require('web3');

// 连接到以太坊网络
const web3 = new Web3('http://127.0.0.1:8545');

// 查询最新区块信息
async function checkEIP1559Support() {
    try {
      const latestBlockNumber = await web3.eth.getBlockNumber();
      const latestBlock = await web3.eth.getBlock(latestBlockNumber);
  
      // 检查baseFeePerGas字段是否存在
      const eip1559Supported = !!latestBlock.baseFeePerGas;
  
      console.log('EIP-1559支持:', eip1559Supported);
    } catch (error) {
      console.error('检测EIP-1559支持时出错:', error);
    }
  }

// 执行检测
checkEIP1559Support();
