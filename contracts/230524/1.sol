// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract Number {
    uint public a;
    function setNum(uint _n) public {
        a=_n;
    }
    function addNumber(uint _n1, uint _n2, uint _n3, uint _n4) public pure returns(uint) {
        return _n1+_n2+_n3+_n4;

    }
}

contract otherContract {
    Number public number;
    constructor(address numberAddress) {
        number = Number(numberAddress);
    }

    function newNumber(uint _a) public {
        number.setNum(_a);
    }
}