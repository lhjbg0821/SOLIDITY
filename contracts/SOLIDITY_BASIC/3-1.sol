// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract BASIC3_1{
    // 3의 배수만 들어갈 수 있는 array를 구현하세요.
    uint[] numbers;
    function numOnly3(uint _n) public {
        require(_n%3==0);
        numbers.push(_n);
    }

}

contract BASIC3_2{
    // 1. 뺄셈 함수를 구현하세요. 임의의 두 숫자를 넣으면 자동으로 둘 중 큰수로부터 작은 수를 빼는 함수를 구현하세요.
    // 예) 2,5 input → 5-2=3(output)
    function subNum(uint _a, uint _b) public pure returns(uint) {
        
    }
}