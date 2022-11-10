import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  defaultNetwork: 'hardhat',
  networks: {
    hardhat: {
      chainId: 1,
    },
    goerli: {
      url: 'https://goerli.infura.io/v3/c1092815dc56459f9bf6faa712857e55',
      chainId: 5,
      gasPrice: 20000000000,
      accounts: [""],//这里填写自己的私钥 注意不要上传到git了 
    },
  },

  solidity: "0.8.17",
};

export default config;
