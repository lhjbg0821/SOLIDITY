// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract Review {
    uint[] score;
    uint average;

    function pushScore(uint _score) public {
        score.push(_score);
    }

    function setAverage() public {
        for (uint i=0;i<score.length;i++){
            average+=score[i];
        }
        average/=score.length;
    }

    function getAverage() public view returns(uint) {
        return average;
    }
}
