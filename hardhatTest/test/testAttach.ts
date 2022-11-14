import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("test", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployOneYearLockFixture() {
    const test = await ethers.getContractFactory('test3');
    const test1 = await test.attach("0x502832a4e0D705205643754eAE34C0bFb1B51d7D");   //连接已部署的合约
    const a = await test1.test(6) //加await  异步调用 等返回结果后 会处理  node的灵魂关键字 
      console.log("a->",a);
    return a;
  }

  describe("test", function () {
    it("test attach contract ", async function () {
      const num = await deployOneYearLockFixture();
      console.log("num ->",num)
      expect(num).to.equal(6);
    });
  });
});
