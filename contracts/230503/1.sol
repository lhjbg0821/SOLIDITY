// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract UintandString {
    uint a; //숫자형 변수 a 선언
    string b; //문자형 변수 b 선언

    function setA(uint _a) public  {
        a=_a;
    }
    function setAasFive() public {
        a=5;
    }

    function getA() public view returns(uint){
        return a;
    }

    function setB(string memory _b) public  {
        b=_b;
    }

    function getB() public view returns(string memory) {
        return b;
    }

    function setBasC() public {
        b="c";
    }

    function setBasC2() public {
        b="C";
    }

    //b를 abc로 만드는 함수를 구현하세요
    function setBasABC() public {
        b="abc";
    }

    //a와 b에 내가 원하는 값을 넣을 수 있는 함수
    //그리고 a와 b의 값을 반환하는 함수를 각각 따로 만드세요.
    function setAB(uint _a, string memory _b) public {
        a=_a;
        b=_b;
    }

    function getAB() public view returns(uint, string memory) {
        return (a,b);
    }

}