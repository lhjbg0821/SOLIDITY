// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract TIMESTAMP {
    uint public time = block.timestamp;

    function getCurrentTime() public view returns(uint){
        return block.timestamp;
    }
}
