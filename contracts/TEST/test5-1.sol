// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract Test5 {
//     숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.

// 예) 2 -> 1,   2 // 45 -> 2,   4,5 // 539 -> 3,   5,3,9 // 28712 -> 5,   2,8,7,1,2
    uint num;

    // function getNum(uint _num) public view returns(uint, uint[] memory) {

    //     for(uint i=0; i<_num.length; i++) {
    //         return _num[i];
    //     }
    // }
// --------------------------------------------------------------------------------------------
// 문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
// 예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f
    // string num;


    function stringToBytes(string memory _input) public view returns(uint, string[] memory) {
        bytes memory input = bytes(_input);
        // string[] memory str = new string[](input.length);

        return (input.length, string[](input.length));
    }
}