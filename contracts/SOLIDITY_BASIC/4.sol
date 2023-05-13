// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract BASIC6 {
    // 숫자만 들어갈 수 있는 array numbers를 만들고
    // 그 array안에 0부터 9까지 자동으로 채우는 함수를 구현하세요.(for 문)
    uint[] numbers;

    function setNum() public {
        for(uint i=0; i<10; i++) {
            numbers.push(i);
        }
    }

    function getNum() public view returns(uint[] memory) {
        return numbers;
    }
}

contract BASIC7 {
    // 숫자만 들어갈 수 있는 array numbers를 만들고
    // 그 array안에 0부터 5까지 자동으로 채우는 함수와
    // array안의 모든 숫자를 더한 값을 반환하는 함수를 각각 구현하세요.(for 문)

    uint[] numbers;

    function setNumbers() public {
        for(uint i=0; i<6; i++) {
            numbers.push(i);
        }
    }

    function getNumbers() public view returns(uint[] memory) {
        return numbers;
    }

    function totalNum() public view returns(uint) {
        uint total;
        for(uint i=0; i<numbers.length; i++) {
            total += numbers[i];
        }
        return total;
    }

}