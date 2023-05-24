// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract BASIC3_1{
    // 3의 배수만 들어갈 수 있는 array를 구현하세요.
    uint[] numbers;
    function numOnly3(uint _n) public {
        require(_n%3==0);
        numbers.push(_n);
    }

}

contract BASIC3_2{
    // 1. 뺄셈 함수를 구현하세요. 임의의 두 숫자를 넣으면 자동으로 둘 중 큰수로부터 작은 수를 빼는 함수를 구현하세요.
    // 예) 2,5 input → 5-2=3(output)
    function subNum(uint _a, uint _b) public pure returns(uint) {
          if(_a > _b) {
              return _a-_b;
          } else {
              return _b-_a;
          }
    }
}

contract BASIC3_3{
    // 3의 배수라면 “A”를, 나머지가 1이 있다면 “B”를, 나머지가 2가 있다면 “C”를 반환하는 함수를 구현하세요.
    function ifNum(uint _n) public pure returns(string memory) {
        if(_n%3==0) {
            return "A";
        } else if (_n%3==1) {
            return "B";
        } else {
            return "C";
        }
    }
}

contract BASIC3_4{
    // string을 input으로 받는 함수를 구현하세요. “Alice”가 들어왔을 때에만 true를 반환하세요.
    function inputString(string memory _name) public pure returns(bool) {
        if(keccak256(bytes(_name)) == keccak256(bytes("Alice"))) {
            return true;
        } else {
            return false;
        }
    }
}

contract BASIC3_5{
    // 배열 A를 선언하고 해당 배열에 n부터 0까지 자동으로 넣는 함수를 구현하세요. 
    uint[] A;
    function setA(uint _n) public {
        for(uint i=_n; i>=0; i--) {
            A.push(i);
        }
    }
}

contract BASIC3_6{
    // 홀수만 들어가는 array, 짝수만 들어가는 array를 구현하고
    // 숫자를 넣었을 때 자동으로 홀,짝을 나누어 입력시키는 함수를 구현하세요.
    uint[] odd;
    uint[] even; 

    function setAB(uint _n) public {
        if(_n%2==0) {
            odd.push(_n);
        } else {
            even.push(_n);
        }
    }

    function getAB() public view returns(uint[] memory, uint[] memory) {
        return (odd, even);
    }
}

contract BASIC3_7{
    // string 과 bytes32를 key-value 쌍으로 묶어주는 mapping을 구현하세요.
    // 해당 mapping에 정보를 넣고, 지우고 불러오는 함수도 같이 구현하세요.

    mapping(string=>bytes32) str_bytes32;

    function setMapping(string memory _a) public {
        str_bytes32[_a] = keccak256(abi.encodePacked(_a));
    }

    function getMapping(string memory _a) public view returns(bytes32) {
        return str_bytes32[_a];
    }

    function deleteMapping(string memory _a) public {
        delete str_bytes32[_a];
    }
}

contract BASIC3_8{
    // ID와 PW를 넣으면 해시함수(keccak256)에 둘을 같이 해시값을 반환해주는 함수를 구현하세요.
    function getHash(string memory _id, string memory _pw) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_id, _pw));
    }
}

contract BASIC3_9{
    // 숫자형 변수 a와 문자형 변수 b를 각각 10 그리고 “A”의 값으로 배포 직후 설정하는 contract를 구현하세요.

    uint a;
    string b;

    constructor(uint _a, string memory _b) {
        a = _a;
        b = _b;
    }
}

contract BASIC3_10{
//     1. 임의대로 숫자를 넣으면 알아서 내림차순으로 정렬해주는 함수를 구현하세요
// (sorting 코드 응용 → 약간 까다로움)
    
//     예 : [2,6,7,4,5,1,9] → [9,7,6,5,4,2,1]
    //  uint[] numArr;

    //  function setNumArr(uint _n) public {
    //     numArr.push(_n);
    //  }

    //  function sorting() public  {
    //      for(uint i=0; i<numArr.length; i++) {
    //          for(uint j=i+1; j<=numArr.length; j++) {
    //              if(numArr[i] < numArr[j]) {
    //                 (numArr[i], numArr[j]) = (numArr[j], numArr[i]);
    //             }
    //          }
    //      }
    //  }

    //  function getNumArr() public view returns(uint[] memory) {
    //      return numArr;
    //  }
    function sorting(uint[] memory numbers) public pure returns(uint[] memory) {
        for(uint i=0;i<numbers.length-1;i++) {
            for(uint j=i+1; j<numbers.length ;j++) {
                if(numbers[i] < numbers[j]) {
                    (numbers[i], numbers[j]) = (numbers[j], numbers[i]);
                }
            }
        }
        return numbers;
    }
}