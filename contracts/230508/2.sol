// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract Struct {
    struct Student {
        string name;
        uint birthday;
        uint number;
    }

    Student[] students;

    function pushStudent(string memory _name, uint _birthday, uint _number) public {
        students.push(Student(_name, _birthday, _number));
    }

    function getStudent(uint _n) public view returns(uint) {
        return students[_n-1].birthday;
    }
}

contract Address {
    address a;

    // contract의 address
    function getAddress() public view returns(address) {
        return address(this);
    }

    // msg.sender의 address 
    function getMyAddress() public view returns(address) {
        return address(msg.sender);
    }

    function getMyBalance() public view returns(uint) {
        return address(msg.sender).balance;
    }

    function setA(address _a) public {
        a = _a;
    }

    function getA() public view returns(address) {
        return a;
    }
}

contract Mapping {
    mapping(uint => uint) a; // key-value 쌍이 숫자-숫자로 연결되어 있는 mapping a
    mapping(uint => string) b; //mapping(자료형 => 자료형) mapping 이름;
    mapping(string => address) c;

    // 이름을 검색하면 그 아이의 키를 반환받는 contract를 구현하고 싶다.
    mapping(string => uint) height;

    // 정보 넣기
    function setHeight(string memory _name, uint _h) public {
        height[_name]=_h; //mapping이름[key값] = value 값
    }

    // 정보 받기
    function getHeight(string memory _name) public view returns(uint){
        return height[_name]; // mapping이름[key 값]
    }

    // 정보 삭제하기
    function deleteHeight(string memory _name) public {
        delete height[_name];
    }
}