// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract BASIC8 {

// 1. 아래의 함수를 만드세요
    
//     1~10을 입력하면 “A” 반환받습니다.
    
//     11~20을 입력하면 “B” 반환받습니다.
    
//     21~30을 입력하면 “C” 반환받습니다.

    function ifNum2(uint _n) public pure returns(string memory) {
        if(_n>0 && _n<=10) {
            return "A";
        } else if(_n>10 && _n<= 20) {
            return "B";
        } else if(_n>20 && _n<=30) {
            return "C";
        } else {
            return "";
        }
    }
}
