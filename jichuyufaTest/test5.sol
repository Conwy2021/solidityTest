// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.0;

contract  test5{

     // 插入排序 正确版
    function insertionSort(uint[] memory a) public pure returns(uint[] memory) {
        // note that uint can not take negative value
        for (uint i = 1;i < a.length;i++){
            uint temp = a[i];
            uint j=i;
            while( (j >= 1) && (temp < a[j-1])){
                a[j] = a[j-1];
                j--;
            }
            a[j] = temp;
        }
        return(a);
    }


    address owner; // 定义owner变量

   // 构造函数
    constructor() public{
      owner = msg.sender; // 在部署合约的时候，将owner设置为部署者的地址
   }

   function getOwner() public view returns(address) {

       return owner;

   }

   // 定义modifier
   modifier onlyOwner {
        emit Log("onlyOwner is",msg.sender);
      require(msg.sender == owner); // 检查调用者是否为owner地址
      _; // 如果是的话，继续运行函数主体；否则报错并revert交易
   }
//我们定义了一个changeOwner函数，运行他可以改变合约的owner，
//但是由于onlyOwner修饰符的存在，只有原先的owner可以调用，别人调用就会报错。这也是最常用的控制智能合约权限的方法。
   function changeOwner(address _newOwner) external onlyOwner{

       emit Log("changeOwner is",_newOwner);
      owner = _newOwner; // 只有owner地址运行这个函数，并改变owner
   }


    event Log(string,address);
}