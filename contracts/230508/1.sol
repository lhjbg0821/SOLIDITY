// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract TEST {
    // 1.이름, 번호, 생년월일을 담은 student라는 구조체와 
    //제목, 번호, 날짜를 담은 class라는 구조체를 선언하시오.
    // 2.student형 변수 s 와 class형 변수 c를 선언하시오.
    // 3. s에 값을 부여하는 함수 setS와 c에 값을 부여하는 함수 setC를 각각 구현하시오
    // 4. 변수 s의 값을 반환받는 함수 getS와 c의 값을 반환받는 함수 getC를 각각 구현하시오.
    // 5. student형 변수들이 들어가는 array students와 class형 변수들이 들어가는 array classes를 선언하시오.
    // 6. students에 student 구조체를 넣는 pushStudent 함수를 구현하세요.
    // 7. classes에 class 구조체를 넣는 pushClass 함수를 구현하세요.
    // 8.students에 student 구조체를 넣는 pushStudent 함수를 구현하세요.
    // 9. classes에 class 구조체를 넣는 pushClass 함수를 구현하세요.

//     숫자형 변수 a, 문자형 변수 b, bytes2형 변수 c를 담은 구조체 D를 선언하세요.
// D형 변수 dd를 선언하세요.
// dd에 값을 부여하는 setDD함수를 구현하세요.
    struct D {
        uint a;
        string b;
        bytes2 c;
    }
    
    D dd;

    function setDD(uint _a, string memory _b, bytes2 _c) public {
        dd=D(_a, _b, _c);
    }
    // dd의 값을 반환하는 getDD 함수를 구현하세요

    function getDD() public view returns(D memory){
        return dd;

    }
//     D형 변수들이 들어가는 array Ds를 선언하세요.
// Ds에 새로운 D형 변수를 넣는 pushD 함수를 구현하세요.

    D[] Ds;
    function pushD(uint _a, string memory _b, bytes2 _c) public {
        Ds.push(D(_a, _b, _c));
    }
    //Ds array의 n번째 요소를 반환받는 getN이라는 함수를 구현하세요.
    function getN(uint _n) public view returns(D memory){
        return Ds[_n-1];
    }



}

contract TEST2{
//     숫자형 변수 number, 문자형 변수 name, bytes2형 변수 password 그리고 memeber라는 구조체를 선언하세요.
// member형 변수 Michael을 선언하세요.
// Michael에 값을 부여하는 setM 함수를 구현하세요.
// member형 변수들이 들어가는 members를 선언하세요.
// members에 새로운 member 변수를 넣는 pushMember 함수를 구현하세요

    struct member {
        uint number;
        string name;
        bytes2 password;
    }
    member Michael;

    function setM(uint _number, string memory _name, bytes2 _password) public {
        Michael = member(_number, _name, _password);
    }

    member[] members;

    function pushMember(uint _number, string memory _name, bytes2 _password) public {
        members.push(member(_number, _name, _password));
    }
 }

 contract review2 {
//숫자형 변수 a, 문자형 변수 b, bytes2형 변수 c를 담은 구조체 D를 선언하세요.
   
//D형 변수 dd를 선언하세요.

//dd에 값을 부여하는 setDD함수를 구현하세요.

//D형 변수들이 들어가는 array Ds를 선언하세요.

//Ds에 새로운 D형 변수를 넣는 pushD 함수를 구현하세요.

}

contract review3 {
//숫자형 변수 number, 문자형 변수 name, bytes2형 변수 password 그리고 member라는 구조체를 선언하세요.
   
//member형 변수 Michael을 선언하세요.

//Michael에 값을 부여하는 setM 함수를 구현하세요.

//member형 변수들이 들어가는 members를 선언하세요.

//members에 새로운 member 변수를 넣는 pushMember 함수를 구현하세요

}

contract review4 {
//숫자형 변수 a, 문자형 변수 b, bytes2형 변수 c를 담은 구조체 D를 선언하세요.
   
//D형 변수 dd를 선언하세요.

//dd에 값을 부여하는 setDD함수를 구현하세요.

//dd의 값을 반환하는 getDD 함수를 구현하세요(추가)

//D형 변수들이 들어가는 array Ds를 선언하세요.

//Ds에 새로운 D형 변수를 넣는 pushD 함수를 구현하세요.

//(추가) 이미 형성된 dd라는 변수를 가져와서 푸쉬도 가능.

//Ds array의 n번째 요소를 반환받는 getN이라는 함수를 구현하세요.(추가)

} 