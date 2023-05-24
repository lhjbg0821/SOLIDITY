// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract TEST8_1{
//     로또 프로그램을 만드려고 합니다.
//     숫자와 문자는 각각 4개 2개를 뽑습니다.
//     6개가 맞으면 1이더, 5개의 숫자가 순서와 함께 맞으면 0.75이더,
//     4개가 맞으면 0.25이더, 3개가 맞으면 0.1이더 2개 이하는 상금이 없습니다. 

    uint a = 1;
    uint b = 2;
    uint c = 3;
    uint d = 4;
    string e = "A";
    string f = "B";

    address payable owner;

    function getLotto(uint _a, uint _b, uint _c, uint _d, string memory _e, string memory _f) public payable {
        require(owner.balance >0.05 ether);
        if(_a == a && _b==b && _c==c && _d==d&& keccak256(bytes(_e)) == keccak256(bytes("a")) &&keccak256(bytes(_f)) == keccak256(bytes("b"))) {
            owner.transfer(1 ether);
        }

        uint count=0;
        if(_a==1) {
            count++;
        }
        if(_b==2) {
            count++;
        }
        if(_c==3){
            count++;
        }
        if(_d==4) {
            count++;
        }
        if(keccak256(bytes(_e)) == keccak256(bytes("A"))) {
            count++;
        }
        if(keccak256(bytes(_f)) == keccak256(bytes("B"))) {
            count++;
        }

        if(count==6) {
            owner.transfer(1 ether);
        } else if(count==5) {
            owner.transfer(0.75 ether);
        } else if(count==4) {
            owner.transfer(0.25 ether);
        } else if(count==3) {
            owner.transfer(0.1 ether);
        }
    }

// 참가 금액은 0.05이더이다.

// 기준 숫자 : 1,2,3,4,A,B
// -----------------------------------------------------------------
// 기준 숫자 설정 기능 : 5개의 사람이 임의적으로 4개의 숫자와 2개의 문자를 넣음.
// 5명이 넣은 숫자들의 중앙값과 알파벳 순으로 따졌을 때 가장 가운데 문자로 설정
// 예) 숫자들의 중앙값 : 1,3,6,8,9 -> 6 // 2,3,4,8,9 -> 4
// 예) 문자들의 중앙값 : a,b,e,h,l -> e // a,h,i,q,z -> i


}