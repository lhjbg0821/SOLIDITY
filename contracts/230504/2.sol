// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract BYTES {
    bytes a;
    bytes1 b;
    bytes2 c;
    bytes32 d;

    function setABC(bytes memory _a, bytes1 _b, bytes2 _c, bytes32 _d) public {
        a=_a;
        b=_b;
        c=_c;
        d=_d;
    }

    function getABC() public view returns(bytes memory, bytes1, bytes2, bytes32) {
        return(a,b,c,d);
    }
}