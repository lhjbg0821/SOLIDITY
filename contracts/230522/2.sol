// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract TIME {
    uint public currentTIme = block.timestamp;

    function currentTime2() public view returns(uint) {
        return block.timestamp;
    }

    function currentBlockNumber() public view returns(uint) {
        return block.number;
    }
}