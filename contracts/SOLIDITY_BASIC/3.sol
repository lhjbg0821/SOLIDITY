// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract BASIC5 {
    // 1. 아래의 함수를 만드세요
    
    // 1~3을 입력하면 입력한 수의 제곱을 반환받습니다.
    
    // 4~6을 입력하면 입력한 수의 2배를 반환받습니다.
    
    // 7~9를 입력하면 입력한 수를 3으로 나눈 나머지를 반환받습니다.

    function ifNum(uint _n) public pure returns(uint) {
        if(_n>0 && _n<=3) {
            return _n**2;
        } else if (_n>3 && _n<=6) {
            return _n*2;
        } else if (_n>6 && _n<=9) {
            return _n%3;
        } else {
            return 0;
        }
    }
}