// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract Review {
    uint[] score;
    uint average;

    function pushScore(uint _score) public {
        score.push(_score);
    }

    function setAverage() public {
        for (uint i=0;i<score.length;i++){
            average+=score[i];
        }
        average/=score.length;
    }

    function getAverage() public view returns(uint) {
        return average;
    }
}


contract Review2 {
    /*
   1. 1, Alice, 90 -> setA()
   2. 2, Bob, 75 -> setB()
   3. 3. Charlie, 85 -> setC()
   4. getStudentsABC()
   5. 초기화 후 1,2,3,4번 다시 해보기
   */

   // 학생 정보 중 번호, 이름, 점수만 입력하면 학점은 자동 계산해 주는 함수
   // 점수가 90점 이상이면 A, 80점 이상이면 B, 70점 이상이면 C, 나머지는 F

   struct Student{
       uint number;
       string name;
       uint score;
       string credit;
   }

   Student A;
   Student B;
   Student C;

    function setA(uint _number, string memory _name, uint _score) public {
       A = Student(_number, _name, _score, setGrade(_score));
   }

    function setB(uint _number, string memory _name, uint _score) public {
       B = Student(_number, _name, _score, setGrade(_score));
   }

      function setC(uint _number, string memory _name, uint _score) public {
       C = Student(_number, _name, _score, setGrade(_score));
   }

   function getABC() public view returns(Student memory, Student memory, Student memory) {
       return (A, B, C);
   }
   Student[] students;
   function pushStudents(uint _number, string memory _name, uint _score) public {

       students.push(Student(_number, _name, _score, setGrade(_score)));
   }

   function getStudents() public view returns(Student[] memory) {
       return students;
   }

   function setGrade(uint _score) public pure returns(string memory) {
       if(_score>=90){
           return "A";
       }else if(_score>=80){
           return "B";
       }else if(_score>=70){
           return "C";
       }else {
           return "F";
       }
   }
}

contract Review3 {
    /*
    실습가이드
    1. getABC()로 초기값 확인해보기
    2. setA(), setB(), setC() 한 후 getABC() 해서 값 변화 확인하기
    3. getABC2() 해서 결과 확인하기
    */

    enum Food {
        Chicken,
        Sushi,
        Bread,
        Coconut
    }

    Food a;
    Food b;
    Food c;

    function setA() public {
        a = Food.Chicken;
    }

    function setB() public {
        b = Food.Sushi;
    }

    function setC() public {
        c = Food.Coconut;
    }

    function setD(uint _n) public {
        c = Food(_n);
    }

    function getABC() public view returns(Food, Food, Food) {
        return(a, b, c);
    }

    
}

contract Review4 {
    /*
    실습가이드
    1. getA(), getST()로 초기값 확인하기 -> (5,0)
    2. higher(), getA() -> 결과 확인하기
    3. higher(), getA() -> 결과 확인하기, status 변화 확인하기
    4. lower() 5번 후 getA() -> 결과 확인하기, status 변화 확인하기
    5. higher() 3번 후 getA() -> 결과 확인하기, status 변화 확인하기 
    */

    enum Status{
        neutral,
        high,
        low
    }

    Status st;
    uint a;

    function higher() public {
        a++;
        setA();
    }

    function lower() public {
        a--;
        setA();
    }

    function setA() public {
        if(a>=7){
            st = Status.high;
        } else if(a<=3){
            st = Status.low;
        } else {
            st = Status.neutral;
        }
    }

    function getA() public view returns(uint) {
        return a;
    }

    function getST() public view returns(Status) {
        return st;
    }

}