// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract BOOL {
    bool isFun;

    function getVar() public view returns(bool) {
        return isFun;
    }

    function Fun() public {
        isFun = true;
    }

    function notFun() public {
        isFun = false;
    }

    function Fun(bool _a) public {
        isFun = _a;
    }
}