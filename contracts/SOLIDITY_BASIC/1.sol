// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract BASIC1 {
    //1 더하기, 빼기, 곱하기, 나누기 그리고 제곱을 반환받는 계산기를 만드세요
    
    function cal(uint _num1, uint _num2) public pure returns(uint, uint, uint, uint, uint) {
        return (_num1+_num2, _num1-_num2, _num1*_num2, _num1/_num2, _num1**2);
    }
}

contract BASIC2 {
    // 2개의 Input값을 가지고 1개의 output값을 가지는 4개의 함수를 만드시오.
    // 각각의 함수는 더하기, 빼기, 곱하기, 나누기(몫)를 실행합니다.

    function add(uint _n1, uint _n2) public pure returns(uint) {
        return _n1+_n2;
    }

    function sub(uint _n1, uint _n2) public pure returns(uint) {
        return _n1-_n2;
    }

    function mul(uint _n1, uint _n2) public pure returns(uint) {
        return _n1*_n2;
    }

    function div(uint _n1, uint _n2) public pure returns(uint) {
        return _n1/_n2;
    }
    
}

contract BASIC3 {
    // 1개의 Input값을 가지고 1개의 output값을 가지는 2개의 함수를 만드시오.
    // 각각의 함수는 제곱, 세제곱을 반환합니다.
    function square(uint _n1) public pure returns(uint) {
        return _n1**2;
    }

    function cubic(uint _n1) public pure returns(uint) {
        return _n1**3;
    }
}
