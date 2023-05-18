// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract TEST4_answer {
    struct User {
        uint number;
        string name;
        address account;
        uint balance;
        uint score;
    }

    mapping(address => User) userList;
    uint count;
    address payable owner;

    constructor() {
        owner = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    User[] public top4;
    User[] public top4_2;

    // 유저 등록 기능 
    function register(string memory _name) public {
        userList[msg.sender] = User(count++, _name, msg.sender, msg.sender.balance, 0);
    }

    // 유저 조회 기능 
    function search(address _a) public view returns(User memory) {
        return userList[_a];
    }

    // 게임 참가 시 참가비 제출 
    function gameIn() public payable {
        require(userList[msg.sender].balance >= 10**16 && msg.value==0 || msg.value == 0.01 ether);
        if(msg.value == 0) {
            userList[msg.sender].balance -= 10**16;
        }
        if(top4.length == 4) {
            for(uint i=4; i>0; i--) {
                userList[top4[i-1].account].score += 5-i;
                top4.pop;
            }  
            delete top4;
        }
        top4.push(userList[msg.sender]);
    }

    function gameIn2() public payable {
        require(userList[msg.sender].balance >= 10**16 && msg.value==0 || msg.value == 0.01 ether);

        if(msg.value==0){
            userList[msg.sender].balance -= 10**16;
        }

        if(getLengthOfTop4()==4) {
            for(uint i=4; i>0; i--) {
                userList[top4_2[i-1].account].score += 5-i;
                // top4.pop(); 밑의 delete로 대체
            }
            delete top4_2;
        }
        top4_2[getLengthOfTop4()] = userList[msg.sender];
    }

    /*
		위의 gameIn2()를 modifier를 사용해본 버전
		modifier isitFour {
        if(getLengthOfTop4()==4) {
            delete top4_2;
            _;
        }
        _;
    }

    function gameIn2_2() public payable isitFour {
        require((userList[msg.sender].balance >= 10**16 && msg.value==0) || msg.value == 0.01 ether);

        if(msg.value==0) {
            userList[msg.sender].balance -= 10**16;
        }

        top4_2[getLengthOfTop4()] = userList[msg.sender];
        
    }*/


    function getLengthOfTop4() public view returns(uint) {
        for(uint i=0; i<4; i++) {
            if(top4_2[i].account == address(0)) {
                return i;
            }
        }
        return 4;
    }

    // 점수를 돈으로 바꾸는 기능 - 10점마다 0.1eth로 환전 
    function withdraw(uint _n) public {
        // 10, 20, 30 이렇게 넣을 때 
        require(_n%10==0 && userList[msg.sender].score >= _n );

        // 1, 2, 3 이렇게 넣을 때
        // require(userList[msg.sender].score >= _n*10);
        userList[msg.sender].score -= _n;
        payable(msg.sender).transfer(_n%10*0.1 ether);

    }

    // 점수를 돈으로 바꾸는 기능 - 10점마다 0.1eth로 환전 (최대 금액 자동 충전)
    function withdraw2() public {
        require(userList[msg.sender].score <= 10);
        uint a = userList[msg.sender].score /10;
        userList[msg.sender].score = userList[msg.sender].score%10;
        payable(msg.sender).transfer(a*0.1 ether);
    }

    // 관리자 인출 기능 - 관리자는 0번 지갑으로 배포와 동시에 설정해주세요.
    // 관리자는 원할 때 잔액 혹은 일부 금액을 인출할 수 있음.
    function ownerWithdraw(uint _n) public onlyOwner {
        owner.transfer(_n*1 ether);
    }

    function ownerWithdrawAll() public onlyOwner {
        owner.transfer(address(this).balance);
    }

    

    // 예치 기능 - 게임할 때마다 참가비를 내지 말고 유저가 일정금액을 미리 예치하고 
    // 게임할대마다 자동으로 지갑시키는 기능 
    function deposit() public payable {
        userList[msg.sender].balance += msg.value;
    }
    


}

contract POPvsDELETE {
    uint[] a;
    uint[4] b;

    function pushA(uint _n) public {
        a.push(_n);
    }

    function returnA() public view returns(uint[] memory) {
        return a;
    }

    function popA() public {
        a.pop(); //41551, 26531, 10267 / 41551, 26531, 10267 / 41551, 26531, 10267 / 47071, 25065, 10267
    }
    /*
    pop과 delete 비교
    array를 초기화 시키기 위해서 delete는 한번만 수행, pop은 여러번 수행해야하는 차이가 있음.
    pop은 같은 양의 cost를 요구하지만 맨 마지막 번에는 추가적인 gas를 요구함 
    */

    function deleteA() public {
        delete a; // 81202, 37288, 25546
    }

    function renewA() public {
        a = new uint[](10);
    }
    /*
    delete와 renew 비교
    delete와 renew 모두 내부 요소의 개수가 커질수록 cost도 늘어난다.
    4개의경우 그리고 10개의 경우 모두 delete가 gas, transaction, execution cost 모두 낫다.
    uint[]의 경우에는 delete가 renew보다 (현 상황으로는) 효과적으로 보임.
    */
}

