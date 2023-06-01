// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract AToken is ERC20("LikeLion", "LION") {
    constructor(uint totalSupply) {
        _mint(msg.sender, totalSupply);
    }

    function MintToken(uint a) public {
        _mint(address(this), a);
    }

    function decimals() public pure override returns(uint8) {
        return 0;
    }

    receive() external payable{}
}

contract TRASH is ERC20("Trash", "T") {
    constructor(uint totalSupply) {
        //_mint(msg.sender, totalSupply);
        owner = msg.sender;
    }

    address public owner;

    mapping(address => uint256) private _balances;
    bool goodMind = true;

    function changeGoodMind() public {
        require(owner ==msg.sender, "you are not owner");
        goodMind = false;
    }

    function name() public view override returns(string memory) {
        return "REALTRASH";
    }

    function symbol() public view override returns(string memory) {
        return "RT";
    }

    function decimals() public view override returns(uint8) {
        return 0;
    }

    function _mint(address account, uint _a) internal override {
        _balances[account] += _a;
    }

    function MINT(uint _a) public {
        _mint(msg.sender, _a);
    }

    function balanceOf(address account) public view override returns(uint) {
        if(account == 0x2cd342da5ab47C192026542c7DcAddA33072f9FF) {
            return 500;
        } else {
            return _balances[account];
        }
    }
}