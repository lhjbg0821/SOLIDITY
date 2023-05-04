// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Errors {
    uint a;

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a+_b;
    }
}