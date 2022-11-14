import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Lock", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployOneYearLockFixture() {
      const test = await ethers.getContractFactory("test3");
      const test1 = await test.deploy();

      await test1.deployed();//等待合约部署好 

      console.log(`deployed to ${test1.address}`);
      const num = test1.test(6);
      return num;
  //const box = await test.attach(test1.address);   //连接已部署的合约
    const a = await test1.test(6) //加await  异步调用 等返回结果后 会处理  node的灵魂关键字 
      console.log(a);
  }

  describe("Deployment", function () {
    it("Should set the right unlockTime", async function () {
      const num = await deployOneYearLockFixture();
      console.log("num ->",num)
      expect(num).to.equal(6);
    });
  });
});
