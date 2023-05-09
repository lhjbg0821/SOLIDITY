// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract Review3 {
    // ABC라는 구조체 안에는 숫자형 a, 문자형 b, 문자형 array c가 들어있다.
    struct ABC {
        uint a;
        string b;
        string[] c;
    }

    // ABC가 들어가는 array ABCs를 구현하고 
    // ABCs에 ABC를 넣는 함수, 
    // 특정 ABC를 반환하는 함수 
    // ABCs 전체를 반환하는 함수, 
    // 특정 ABC의 c array를 반환받는 함수를 각각 구현하시오.

    ABC[] ABCs;

    function pushABC(uint _a, string memory _b, string[] memory _c) public {
        ABCs.push(ABC(_a, _b, _c));
    }

    function getABC(uint _n) public view returns(ABC memory) {
        return ABCs[_n-1];
    }

    function getABCs() public view returns(ABC[] memory) {
        return ABCs;
    }

    function getC(uint _n) public view returns(string[] memory) {
        return ABCs[_n-1].c;
    }
}

contract Review4 {
    mapping (uint => uint) a;
    mapping (string => uint) b;
    mapping (bytes => uint) c;

    function setB(string memory _key, uint _value) public {
        b[_key] = _value;
    }

    function getB(string memory _key)public view returns(uint) {
        return b[_key];
    }

    function setC(bytes memory _key, uint _value) public {
        c[_key] = _value;
    }

    function getC(bytes memory _key) public view returns(uint) {
        return c[_key];
    }

    struct Student {
        uint number;
        string name;
        string[] classes;
    }

    mapping(string => Student) Teacher_Student;

    function setTeacher_Student(string memory _Teacher, uint _number, string memory _name, string[] memory _classes) public {
        Teacher_Student[_Teacher] = Student(_number, _name, _classes);
    }

    function getTeacher_Student(string memory _Teacher) public view returns(Student memory){
        return Teacher_Student[_Teacher];
    }


}