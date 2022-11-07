pragma solidity ^0.8.4;

import "github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/access/OwnableUpgradeable.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/proxy/utils/Initializable.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/proxy/utils/UUPSUpgradeable.sol";
import "hardhat/console.sol";

contract testUpgradeableV1 is 
    Initializable, 
    OwnableUpgradeable, 
    UUPSUpgradeable
{
    string public a;
    function initialize(string memory _a) public initializer {
        a=  _a;
        __Ownable_init();
        __UUPSUpgradeable_init();
        console.log("test v1");
    }

   

    
    

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}