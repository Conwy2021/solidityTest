// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract LighthouseGovernanceToken is ERC20Votes {
    uint256 public s_maxSupply = 1e24;//原1e24 改为100 改为100 不行 貌似在proposalVotes 中统计时会有精度缩写 但是没找到在哪里

    constructor()
        ERC20("LighthouseGovernanceToken", "LGT")
        ERC20Permit("LighthouseGovernanceToken")
    {
        _mint(msg.sender, s_maxSupply);
    }

    // The functions below are overrides required by Solidity.

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override(ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount) internal override(ERC20Votes) {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20Votes)
    {
        super._burn(account, amount);
    }
}
