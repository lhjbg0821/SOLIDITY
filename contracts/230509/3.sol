// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract Review5 {
    struct Student {
        uint number;
        string name;
        string[] classes;
    }

    mapping(string => Student) Teacher_Student;
    mapping(string => Student[]) Teacher_class;

    function setTeacher_Student(string memory _teacher, uint _number, string memory _name, string[] memory _classes) public {
        Teacher_Student[_teacher] = Student(_number, _name, _classes);
    }

    function getTeacher_Student(string memory _teacher) public view returns(Student memory) {
        return Teacher_Student[_teacher];
    }

    function setTeacher_Class(string memory _Teacher, uint _number, string memory _name, string[] memory _classes) public {
        Teacher_class[_Teacher].push(Student(_number, _name, _classes));
    }

    function getTeacher_Class(string memory _Teacher) public view returns(Student[] memory) {
        return Teacher_class[_Teacher];
    }
} 