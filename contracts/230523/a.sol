// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import './b.sol'; // import './위치/파일명';
import './d/dd.sol';

contract A {
    B_Contract b = new B_Contract();
    D_Contract d_con = new D_Contract();

    function add(uint _a, uint _b) public view returns(uint) {
        return b.add(_a, _b);
    }

    function multi(uint _a, uint _b) public view returns(uint) {
        return d_con.multiply(_a, _b);
    }
}

contract B {
    function returnValue(uint a) public pure returns(uint) {
        return a;
    }

    function returnValue(int b) public pure returns(int) {
        return b;
    }
}