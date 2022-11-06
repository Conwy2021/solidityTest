pragma solidity ^0.8.4;
import "github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/token/ERC1155/ERC1155Upgradeable.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/access/OwnableUpgradeable.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/proxy/utils/Initializable.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/proxy/utils/UUPSUpgradeable.sol";


coERC1155UpgradeableV1ntract  is 
    Initializable, 
    OwnableUpgradeable, 
    ERC1155Upgradeable, 
    UUPSUpgradeable
{

    function initialize(string memory a) public initializer {
        __ERC1155_init("");
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    function setURI(string memory newuri) public {
        _setURI(newuri);
    }

    function mint(
        address account,
        uint256 id,
        uint256 amount
    ) public {
        _mint(account, id, amount, "");
    }

    function mintBatch(
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) public {
        _mintBatch(to, ids, amounts, data);
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}