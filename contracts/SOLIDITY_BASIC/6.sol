// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract BASIC9 {
// 9. 문자형을 입력하면 bytes 형으로 변환하여 반환하는 함수를 구현하세요.
    function stringToBytes(string memory _str) public pure returns(bytes memory) {
        return bytes(_str);
    }
}

contract BASIC10 {
    // 숫자만 들어가는 array numbers를 선언하고
    // 숫자를 넣고(push), 빼고(pop), 특정 n번째 요소의 값을 볼 수 있는(get)함수를 구현하세요.

    uint[] numbers;

    function pushNum(uint _n) public {
        numbers.push(_n);
    }

    function popNum() public {
        numbers.pop();
    }

    function getNum(uint _n) public view returns(uint) {
        return numbers[_n-1];
    }

    function getNumbers() public view returns(uint[] memory) {
        return numbers;
    }
}