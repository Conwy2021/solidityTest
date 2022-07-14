pragma solidity ^0.4.22;
import "hardhat/console.sol";

contract TokenExample {
    address public owner;
    mapping(address => uint256) public balances;
    mapping(address=>mapping(address=>uint256)) public allowed;
    
    event Transfer(address _from,address _to,uint256 _value);
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    constructor() public {
        owner = msg.sender; 
        balances[owner] = 2000 * 10**8;
    }
    
    function distribute(address[] addresses) public onlyOwner {
        for (uint i = 0; i < addresses.length; i++) {
             balances[owner] -= 2000 * 10**8;
             console.log("owner",balances[owner]);
             balances[addresses[i]] += 2000 * 10**8;
             emit Transfer(owner, addresses[i], 2000 * 10**8);
         }
    }
//     console.log:
//      owner 0
//      owner 115792089237316195423570985008687907853269984665640564039457584007713129639936
}