// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

import "@openzeppelin/contracts/utils/Strings.sol";

//     로또 프로그램을 만드려고 합니다.
//     숫자와 문자는 각각 4개 2개를 뽑습니다.
//     6개가 맞으면 1이더, 5개의 숫자가 순서와 함께 맞으면 0.75이더,
//     4개가 맞으면 0.25이더, 3개가 맞으면 0.1이더 2개 이하는 상금이 없습니다. 

// 참가 금액은 0.05이더이다.

// 기준 숫자 : 1,2,3,4,A,B
// -----------------------------------------------------------------
// 기준 숫자 설정 기능 : 5개의 사람이 임의적으로 4개의 숫자와 2개의 문자를 넣음.
// 5명이 넣은 숫자들의 중앙값과 알파벳 순으로 따졌을 때 가장 가운데 문자로 설정
// 예) 숫자들의 중앙값 : 1,3,6,8,9 -> 6 // 2,3,4,8,9 -> 4
// 예) 문자들의 중앙값 : a,b,e,h,l -> e // a,h,i,q,z -> i
contract TEST8_1 {
    uint[] numbers = [1,2,3,4];
    string[] letters = ["a", "b"];

    function setLotto(uint[] calldata _numbers, string[] calldata _letters) public payable {
        require(msg.value==0.05 ether);
        uint fit = isSameNumber(_numbers) + isSameLetter(_letters);
        getPrize(fit);
    }

    function getPrize(uint _n) public {
        if(_n==6) {
            payable(msg.sender).transfer(1 ether);
        } else if (_n==5) {
            payable(msg.sender).transfer(0.75 ether);
        } else if (_n==4) {
            payable(msg.sender).transfer(0.25 ether);
        } else if (_n==3) {
            payable(msg.sender).transfer(0.1 ether);
        } 
    }

    function isSameNumber(uint[] calldata _myNumber) public view returns(uint) {
        uint count;

        for(uint i=0; i<numbers.length; i++) {
            if(numbers[i] == _myNumber[i]) {
                count++;
            }
        }
        return count;
    }

    function isSameLetter(string[] calldata _myLetter) public view returns(uint) {
        uint count;
        for(uint i=0; i<_myLetter.length; i++) {
            if(letterCompare(letters[i], _myLetter[i])) {
                count++;
            }
        }
        return count;
    }

    function letterCompare(string memory _a, string memory _b) public pure returns(bool) {
        return keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked(_b));
    }
}

contract TEST8_2 {
    uint[] public numbers;
    string[] public letters;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    // function uintToString(uint _a) public view returns(string memory) {
    //     return Strings.toString(_a);
    // }

    function setTargetNumber(uint[] memory _numbers, string[] memory _letters) public {
        require(owner == msg.sender);
        numbers = _numbers;
        letters = _letters;
    }

    // 로또 번호 입력, 맞추는 기능 - 유저가 로또 번호를 입력하는 기능, 로또 번호를 맞추는 기능 
    function setLotto(uint[] calldata _numbers, string[] calldata _letters) public payable {
        require(msg.value==0.05 ether);
        uint fit = isSameNumber(_numbers) + isSameLetter(_letters);
        getPrize(fit);
    }

    function getPrize(uint _n) private { // public 으로 하면 자선사업가..
        if(_n==6) {
            payable(msg.sender).transfer(1 ether);
        } else if (_n==5) {
            payable(msg.sender).transfer(0.75 ether);
        } else if (_n==4) {
            payable(msg.sender).transfer(0.25 ether);
        } else if (_n==3) {
            payable(msg.sender).transfer(0.1 ether);
        } 
    }

    function isSameNumber(uint[] calldata _myNumber) public view returns(uint) {
        uint count;

        for(uint i=0; i<numbers.length; i++) {
            if(numbers[i] == _myNumber[i]) {
                count++;
            }
        }
        return count;
    }

    function isSameLetter(string[] calldata _myLetter) public view returns(uint) {
        uint count;
        for(uint i=0; i<_myLetter.length; i++) {
            if(letterCompare(letters[i], _myLetter[i])) {
                count++;
            }
        }
        return count;
    }

    function letterCompare(string memory _a, string memory _b) public pure returns(bool) {
        return keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked(_b));
    }
}

contract TEST8_3 {
    // 로또 번호 설정 기능 
    function setLotto(string[] memory _set1, string[] memory _set2, string[] memory _set3, string[] memory _set4, string[] memory _set5, string[] memory _set6) public {
        // getMedian 함수 4번 실행 
        string[] memory a = new string[](6);
        a[0] = string(abi.encodePacked(getMedian_Number(stringArrayToBytes1Array(_set1))));
        a[1] = string(abi.encodePacked(getMedian_Number(stringArrayToBytes1Array(_set2))));
        a[2] = string(abi.encodePacked(getMedian_Number(stringArrayToBytes1Array(_set3))));
        a[3] = string(abi.encodePacked(getMedian_Number(stringArrayToBytes1Array(_set4))));
        a[4] = string(abi.encodePacked(getMedian_Number(stringArrayToBytes1Array(_set5))));
        a[5] = string(abi.encodePacked(getMedian_Number(stringArrayToBytes1Array(_set6))));
        // for(uint i=0; i<4; i++) {
        //     // a[i] = getMedian(_numbers);
        // }
    }

    function stringArrayToBytes1Array(string[] memory _a) public pure returns(bytes1[] memory) {
        uint _n = _a.length;
        bytes1[] memory _b = new bytes1[](_n);
        for(uint i=0; i<_n;i++) {
            _b[i] = abi.encodePacked(_a[i])[0];
        }
        return _b;
    }


    function bytesAverage(bytes1 a, bytes1 b) public pure returns(bytes1) {
        return bytes1((uint8(a) + uint8(b))/2); 
    }

     function getMedian_Number(bytes1[] memory numbers) public pure returns(bytes1){
        uint _l = numbers.length;
        for(uint i=0;i<_l-1;i++) {
            for(uint j=i+1; j<_l ;j++) {
                if(numbers[i] < numbers[j]) {
                    (numbers[i], numbers[j]) = (numbers[j], numbers[i]);
                }
            }
        }
        if(_l %2 ==0) {
            return bytesAverage(numbers[_l/2-1], numbers[_l/2]);
        } else {
            return (numbers[_l/2]);
        }
    }


}