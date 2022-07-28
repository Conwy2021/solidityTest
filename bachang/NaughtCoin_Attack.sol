pragma solidity ^0.6.0;

interface NaughtCoin {
  function  transfer(address, uint256 ) external returns(bool) ;
}

contract Attack{

     NaughtCoin nau;
    function init(address add) public{
         nau= NaughtCoin(add);
    }
    

    function attackGO(address _to,uint256 _value) public{//想绕过靶场中if (msg.sender == player)的判断
    //此方法攻击不行  原因是代币合约会查询调用者是否有代币 很显然这个合约是没有代币的 因此在第一步判断中就失效了

        nau.transfer(_to, _value );//
    }
}