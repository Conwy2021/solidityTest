import { ethers } from "hardhat";

async function main() {
  
  const test = await ethers.getContractFactory("test3");
  const test1 = await test.deploy();

  await test1.deployed();//等待合约部署好 

  console.log(`deployed to ${test1.address}`);

  //const box = await test.attach(test1.address);   //连接已部署的合约
  const a = await test1.test(6) //加await  异步调用 等返回结果后 会处理  node的灵魂关键字 
  console.log(a);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
