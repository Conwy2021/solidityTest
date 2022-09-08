// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import 'hardhat/console.sol';
// 合约继承
contract Yeye {
    event Log(string msg);

    // 定义3个function: hip(), pop(), man()，Log值为Yeye。
    function hip() public virtual{
        emit Log("Yeye");
    }

    function pop() public virtual{
        emit Log("Yeye");
    }

    function yeye() public virtual {
        emit Log("Yeye");
    }

    function yeye22() public virtual {
        console.log('Yeye`s yeye22()');

    }
}

contract Baba is Yeye{
    // 继承两个function: hip()和pop()，输出改为Baba。
    function hip() public virtual override{
        emit Log("Baba");
    }

    function pop() public virtual override{
        emit Log("Baba");
    }

    function baba() public virtual{
        emit Log("Baba");
    }
    function test141() public {
        yeye22();
    }
    function test44() public {
        super.yeye22();
    }
}

contract Erzi is Yeye, Baba{
    // 继承两个function: hip()和pop()，输出改为Erzi。
    function hip() public virtual override(Yeye, Baba){
        emit Log("Erzi");
    }

    function pop() public virtual override(Yeye, Baba) {
        emit Log("Erzi");
    }

    function callParent() public{
        Yeye.pop();
    }

    function callParentSuper() public{
        super.pop();
    }
    function yeye22() public virtual override{
        console.log('Erzi`s yeye22()');
    }
    function test69() public {
        super.yeye22();
    }
}

// 构造函数的继承
abstract contract A {
    uint public a;

    constructor(uint _a) {
        a = _a;
    }
}

contract B is A(1) {
}

contract C is A {
    constructor(uint _c) A(_c * _c) {}
}