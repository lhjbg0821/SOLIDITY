// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract BASIC4_1 {
    // string을 input으로 받는 함수를 구현하세요. "Alice"나 "Bob"일 때에만 true를 반환하세요.
    function inputString(string memory _name) public pure returns(bool) {
        if(keccak256(bytes(_name)) == keccak256(bytes("Alice")) || keccak256(bytes(_name)) == keccak256(bytes("Bob"))) {
            return true;
        } else {
            return false;
        }
    }

    function inputString2(string memory _name) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_name));
    }

    function inputString2_1(string memory _name) public pure returns(bool) {
        return (inputString2(_name) == inputString2("Alice") || inputString2(_name) == inputString2("Bob"));
    }
}

contract BASIC4_2 {
    // 1. 3의 배수만 들어갈 수 있는 array를 구현하되,
    // 3의 배수이자 동시에 10의 배수이면 들어갈 수 없는 추가 조건도 구현하세요.
    
    // 예) 3 → o , 9 → o , 15 → o , 30 → x

    uint[] numArr;

    function ifNumArr(uint _n) public {
        require(_n%10!=0);
        if(_n%3==0) {
            numArr.push(_n);
        }
    }

    function geTNumArr() public view returns(uint[] memory) {
        return numArr;
    }
}

contract BASIC4_3 {
    // 이름, 번호, 지갑주소 그리고 생일을 담은 고객 구조체를 구현하세요.
    // 고객의 정보를 넣는 함수와 고객의 이름으로 검색하면 해당 고객의 전체 정보를 반환하는 함수를 구현하세요.
    struct User {
        string name;
        uint number;
        address myAddress;
        uint birth;
    }

    mapping(string => User) name_user;

    function setUser(string memory _name, uint _number, address _myAddress, uint _birth) public {
        name_user[_name] = User(_name, _number, _myAddress, _birth);
    }

    function searchName(string memory _name) public view returns(User memory) {
        return name_user[_name];
    }
}

contract BASIC4_4 {
    // 이름, 번호, 점수가 들어간 학생 구조체를 선언하세요.
    // 학생들을 관리하는 자료구조도 따로 선언하고 학생들의 전체 평균을 계산하는 함수도 구현하세요.

    struct Student {
        string name;
        uint number;
        uint score;
    }

    Student[] students;

    function setStudent(string memory _name, uint _number, uint _score) public {
        students.push(Student(_name, _number, _score));
    } 

    function averageScore() public view returns(uint) {
        uint total;
        for(uint i=0; i<students.length; i++) {
            total += students[i].score;
        }
        return total/students.length;
    }
}

contract BASIC4_5 {
    // 숫자만 들어갈 수 있는 array를 선언하고 해당 array의 짝수번째 요소만 모아서 반환하는 함수를 구현하세요.
    
    // 예) [1,2,3,4,5,6] -> [2,4,6] // [3,5,7,9,11,13] -> [5,9,13]

    uint[] numbers;

    function evenNum(uint[] memory _numbers) public returns(uint[] memory) {

        for(uint i=0; i<numbers.length/2; i+=2) {
            numbers.push(_numbers[i+1]);
        }
        return numbers;
    }
}