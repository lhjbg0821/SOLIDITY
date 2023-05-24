// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract TEST7_1{
//     숫자를 시분초로 변환하세요.
// 예) 100 -> 1분 40초, 600 -> 10분, 1000 -> 16분 40초, 5250 -> 1시간 27분 30초

/*
10000 => 166*60 (분) + 10000%60 (초)
166   => 2**60(시간) + 166%60 (분) 
*/

    // 시분초 uint값 만 반환 
    function numToSeconds(uint _n) public pure returns(uint, uint, uint){
        uint hs;
        uint mins;
        uint secs;


        hs = _n/60/60;
        mins = (_n%3600)/60;
        secs = _n%60;

        return (hs, mins, secs);
        
    }

    // 시분초 string 형태로 반환 
    function numToSeconds2(uint _n) public pure returns(string memory) {
        uint hs;
        uint mins;
        uint secs;


        hs = _n/60/60;
        mins = (_n%3600)/60;
        secs = _n%60;
        
        string memory timeToString = string(abi.encodePacked(
            hs,
            ": ",
            mins,
            ":  ",
            secs
        ));

        return timeToString;
    }

    

}