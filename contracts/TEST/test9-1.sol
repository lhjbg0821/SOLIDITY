// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract TEST9_1{

// 흔히들 비밀번호 만들 때 대소문자 숫자가 각각 1개씩은 포함되어 있어야 한다 등의 조건이 붙는 경우가 있습니다.
// 그러한 조건을 구현하세요.

// 입력값을 받으면 그 입력값 안에 대문자, 소문자 그리고 숫자가 최소한 1개씩은 포함되어 있는지
// 여부를 알려주는 함수를 구현하세요.

    function pw(string memory _pw) public pure returns(bool) {
        bytes memory password = bytes(_pw);
        // bytes1 pw_bytes;

        bool isUpper;
        bool isLower;
        bool isNum;

        for (uint i=0; i<password.length; i++) {
            // pw_bytes = password[i];

            //대문자 
            if(password[i] >= 65 && password[i] <= 90) {
                isUpper = true;
            }
            //소문자 
            else if (password[i] >= 97 && password[i] <= 122) {
                isLower = true;
            }
            // 숫자 
            else if (password[i] >= 48 && password[i] <= 57) {
                isNum = true;
            }
        }
        return isUpper && isLower && isNum;
    }


}

