pragma solidity ^0.8.4;

import "github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/access/OwnableUpgradeable.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/proxy/utils/Initializable.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/proxy/utils/UUPSUpgradeable.sol";
import "hardhat/console.sol";

contract testUpgradeableV2 is 
    Initializable, 
    OwnableUpgradeable, 
    UUPSUpgradeable
{
    string public a;
    string public bb;
    function initialize(string memory _a,string memory _bb) public initializer {
        a=  _a;
        bb=_bb;
        __Ownable_init();
        __UUPSUpgradeable_init();
        console.log("test v2");
    }

   

    
    

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}