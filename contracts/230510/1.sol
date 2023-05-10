// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract Review1 {
    struct Student {
        string name;
        uint number;
        string[] classes;
    }

    Student[] students;
    function setstudents(string memory _name, uint _number, string[] memory _classes) public {
        students.push(Student(_name, _number, _classes));
    }

    function getstudents(uint _n) public view returns(Student memory) {
        return students[_n-1];
    }

    function getName(uint _n) public view returns(string memory) {
        return students[_n-1].name;
    }

    mapping(string => Student[]) Teacher;

    function pushStudent(string memory _Teacher, string memory _name, uint _number, string[] memory _classes) public {
        Teacher[_Teacher].push(Student(_name, _number, _classes));
    }

    function pushStudent2(string memory _teacher, uint _n, uint _number) public {
        Teacher[_teacher][_n-1].number = _number;
    }

    function getStudent(string memory _Teacher) public view returns(Student[] memory) {
        return Teacher[_Teacher];
    }
}