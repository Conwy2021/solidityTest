pragma solidity ^0.8.9;



contract MyToken {

     function _addLiquidity(//计算按比例投入时 需要的Ａ和B　因为在投入时　有人兑换会影响池子的比例
        // address tokenA,
        // address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        uint reserveA, uint reserveB
    ) public view returns (uint amountA, uint amountB) {//这一步 限制转入的代币a 和代币b 的比值 要比池子的比例大才行 
        // create the pair if it doesn't exist yet
       
       // (uint reserveA, uint reserveB) = 100;
        if (reserveA == 0 && reserveB == 0) {
            (amountA, amountB) = (amountADesired, amountBDesired);
        } else {
            uint amountBOptimal = amountADesired*(reserveB) / reserveA;
            if (amountBOptimal <= amountBDesired) {
                require(amountBOptimal >= amountBMin, 'UniswapV2Router: INSUFFICIENT_B_AMOUNT');
                (amountA, amountB) = (amountADesired, amountBOptimal);// 投入我填写的A 和 合适的B
            } else {
                uint amountAOptimal =amountBDesired*(reserveA) / reserveB;
                assert(amountAOptimal <= amountADesired);
                require(amountAOptimal >= amountAMin, 'UniswapV2Router: INSUFFICIENT_A_AMOUNT');
                (amountA, amountB) = (amountAOptimal, amountBDesired);// 投入合适的A 和 我填写的B
            }
        }
    }
}