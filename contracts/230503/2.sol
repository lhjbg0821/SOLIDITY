// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract BYTES {
    bytes a;

    function setA(bytes memory _a) public{
        a=_a;
    }

    function setA2() public{
        a="16";
    }

    function setA3(string memory _a) public{
        a=bytes(_a);
    }

    function getA() public view returns(bytes memory) {
        return a;
    }

    //입력한 수의 제곱을 반환해주는 함수를 구현하세요.
    function Square(uint _a) public pure returns(uint) {
        return _a**2;
    }

    function Cubic(uint _a) public pure returns(uint) {
        return _a**3;
    }
    
    //a의 b승
    function Power(uint _a, uint _b) public pure returns(uint) {
        return _a**_b;
    }

}