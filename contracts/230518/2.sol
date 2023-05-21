// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract REVERSEARRAY{
    function reverse(uint[] memory numbers) public pure returns(uint[] memory) {
        uint[] memory _reverse = new uint[](numbers.length);
        for(uint i=0; i<numbers.length; i++) {
            _reverse[i] = numbers[i];
        }
        return _reverse;
    }

    function reverse2(uint[] memory numbers) public pure returns(uint[] memory) {
        for(uint i=0; i<numbers.length/2; i++) {
            (numbers[i], numbers[numbers.length-1-i])=(numbers[numbers.length-1-i], numbers[i]);
        }
        return numbers;
    }
}