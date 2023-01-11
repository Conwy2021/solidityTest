// SPDX-License-Identifier: MIT

contract test{

    function _add(uint256 a, uint256 b)  private pure returns (uint256) {// 这里貌似也只能是私有
        return a + b;
    }

    function _subtract(uint256 a, uint256 b) private pure returns (uint256) {
        return a - b;
    }                                                                 //这里只能是view                 // 这里只能是私有权限
    function _writeCheckpoint(uint256 A,uint256 B,function(uint256, uint256) view returns (uint256) op) private  returns (uint256){


        uint256 c= op(A,B);
        return c;

    }

    function testGO(uint256 A,uint256 B) public returns (uint256){

        uint256 c =_writeCheckpoint( A,  B,_add);//这个地方可以控制 传入的函数是加还是减
        return c;
    }
}