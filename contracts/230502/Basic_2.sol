// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Basic2 {
    // 2개의 input 값을 받아 더한 값을 반환하는 함수 Add, 곱한 값을 반환하는 함수 Mul을 구현하세요


    function Add(uint _a, uint _b) public pure returns(uint) {
        return _a+_b;
    }
    function Mul(uint _a, uint _b) public pure returns(uint) {
        return _a*_b;
    }
    function Sub(uint _a, uint _b) public pure returns(uint) {
        return _a-_b;
    }
    function Div(uint _a, uint _b) public pure returns(uint, uint) {
        return (_a/_b, _a%_b);
    }
    
}