// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract Test {
//     여러분은 선생님입니다. 학생들의 정보를 관리하려고 합니다. 
// 학생의 정보는 이름, 번호, 점수, 학점 그리고 듣는 수업들이 포함되어야 합니다.
    struct Student {
        string name;
        uint number;
        uint score;
        string credit;
        string[] classes;
    }
    mapping (string => uint) mapstudent;
    uint count=1;

    Student[] students;
    uint average;
// 학점은 점수에 따라 자동으로 계산되어 기입하게 합니다. 90점 이상 A, 80점 이상 B, 70점 이상 C, 60점 이상 D, 나머지는 F 입니다.
    function setGrade(uint _score) public pure returns(string memory) {
        if(_score>=90){
            return "A";
        } else if(_score>=80){
            return "B";
        } else if(_score>=70){
            return "C";
        } else if(_score>=60){
            return "D";
        }else {
            return "F";
        }
    }
// * 학생 추가 기능 - 특정 학생의 정보를 추가
    function setStudent(string memory _name, uint _number, uint _score, string[] memory _classes) public {
        students.push(Student(_name, _number, _score, setGrade(_score), _classes));
    }
// * 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
    function getStudent1(uint _n) public view returns(Student memory) {
        return students[_n-1];
    }
// * 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
    function getStudent2(string memory _name) public view returns(Student memory) {
        return students[mapstudent[_name]];
    }
// * 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
    function getScore(string memory _name) public view returns(uint) {
        return students[mapstudent[_name]].score;
    }
// * 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
    function getLengh() public view returns(uint) {
        return students.length;
    }
// * 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
    function getStudents() public view returns(Student[] memory) {
        return students;
    }
// * 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
    function setAverage() public view returns(uint) {
        uint sum;
        for (uint i=0; i<students.length; i++){
            sum += students[i].score;
        }
        return sum/students.length;
    }
// * 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
    function getSelfTest() public view returns(bool) {
        if(setAverage()>=70) {
            return true;
        } else {
            return false;
        }
    }    
// * 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환
    Student[] FClass;
    function setF() public {
        for(uint i=0; i<students.length; i++){
            if(students[i].score<60){
                FClass.push();
            }
        }
    }
    function getF() public view returns(uint, Student[] memory) {

        return (FClass.length, FClass);
    }
// -------------------------------------------------------------------------------

// * S반 조회 기능 - 가장 점수가 높은 학생 4명을 S반으로 설정하는데, 이 학생들의 전체 정보를 반환하는 기능 (S반은 4명으로 한정)
    // Student[4] SClass;
    // function setS() public {
    //     for(uint i=0 ; i<students.length; i++){
    //         if(students[i].score<students[i+1].score){
    //             students[i]=students[i+1];
    //         }
    //     }
    //     SClass.push(0, 1, 2, 3);
    // }
    // function getS() public view returns(Student[] memory) {
    //     return SClass;
    // }

}