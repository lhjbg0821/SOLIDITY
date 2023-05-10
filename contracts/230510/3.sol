// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract ENUM {
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
        c = Food.Bread;
    }

    function getABC() public view returns(Food, Food, Food) {
        return(a, b, c);
    }

    function getABC2() public view returns(uint8, uint8, uint8) {
        return (uint8(a), uint8(b), uint8(c));
    }
}

contract ENUM2 {
    enum color {
        red,
        yellow,
        green,
        blue,
        purple,
        rainbow
    }

    color c;

    function setC() public {
        c = color.red;
    }

    function setC2(uint _n) public {
        c = color(_n);
    }

    function getC() public view returns(uint8) {
        return uint8(c);
    }

    function getC2() public view returns (color) {
        return c;
    }
}

contract ENUM3 {
    enum Status {
        neutral,
        high,
        low
    }
    Status st;
    uint a=5;

    function higher() public {
        a++;
        // 7이상
        if(a>=7){
            st = Status.high;
        }
    }

    function lower() public {
        a--;
        // 3이하
        if(a<=3){
            st = Status.low;
        }
    }

    function getA() public view returns(uint) {
        return a;
    }

    function getST() public view returns(Status) {
        return st;
    }

    function setA() public {
        if(a>=7){
            st=Status.high;
        } else if(a<=3){
            st = Status.low;
        } else {
            st = Status.neutral;
        }
    }
}