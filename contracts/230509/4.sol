// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract Note {
    function forLoop() public pure returns(uint) {
        uint a;
        for (uint i=1; i<6; i++){
            a = a+i;
        }
        return a;
    }

    function forLoop2() public pure returns(uint, uint){
        uint a;
        uint i;

        for(i=1; i<6; i++ /*시작점; 끝점; 변화방식*/) {
            a = a+i;
        }

        return (a,i);
    }

    function forLoop3() public pure returns(uint, uint) {
        uint a;
        uint i;

        for (i=1 ; i<=5 ; i++){
            a=a+i;
        }
        return (a,i);
    }

    uint[4] c;
    uint count;

    function pushC(uint _n) public {
        c[count++] = _n;
    }

    function getC() public view returns(uint[4] memory) {
        return c;
    }

    function forLoopC() public view returns(uint) {
        uint a;
        for(uint i=0;i<c.length;i++) {
            a=a+c[i];
        }

        return a;
    }

    uint[] d;

    function pushD(uint _n) public {
        d.push(_n);
    }

    function getD() public view returns(uint[] memory){
        return d;
    }

    function forLoopD() public view returns(uint) {
        uint a;
        for (uint i=0;i<d.length;i++){
            a = a+d[i];
        }
        return a;
    }
    
} 

contract flexArray {
    uint[] a;
    uint[4] b;

    function getALength() public view returns(uint) {
       return  a.length;
    }

    function pushA(uint _a) public {
        a.push(_a);
    }
    
    function getA() public view returns(uint[] memory){
        return a;
    }

    function getBLength() public view returns(uint) {
        return b.length;
    }

    function pushB(uint _b) public {
        b[0] = _b;
    }

    function getB() public view returns(uint[4] memory) {
        return b;
    }

    uint count;
    function pushB2(uint _n) public{
        b[count++]=_n;
    }

    function pushB3(uint _n) public{
        b[++count]=_n;
    }
}
