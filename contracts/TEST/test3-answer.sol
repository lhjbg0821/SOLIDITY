// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract TEST3 {
//     자동차를 운전하려고 합니다.
// 자동차의 상태에는 정지, 운전중, 시동 끔, 연료없음 총 4가지 상태가 있습니다.

    enum carStatus {
        stop,
        driving,
        turnedOff,
        outOfFuel
    }

    struct car {
        carStatus status;
        uint fuelGuage;
        uint speed;
    }

    car public myCar;
    address payable public owner; 

    constructor(/*필요하면 input값을 받아서 실행해야함*/) {
        owner = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        // owner = payable(msg.sender) => 2번 지갑으로 배포해야함.
    }

// 정지는 속도가 0인 상태, 운전 중은 속도가 있는 상태이다. 

// * 악셀 기능 - 속도를 1 올리는 기능, 악셀 기능을 이용할 때마다 연료가 2씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 
// 70이상이면 악셀 기능은 더이상 못씀
    function accel() public {
        require(myCar.fuelGuage > 30 && myCar.speed < 70 && myCar.status!=carStatus.turnedOff);
        if(myCar.status != carStatus.driving) {
            myCar.status == carStatus.driving;
        }
        myCar.speed++;
        myCar.fuelGuage -= 2;
    }

// * 브레이크 기능 - 속도를 1 줄이는 기능, 속도가 0인 상태, 브레이크 기능을 이용할 때마다 연료가 1씩 줄어듬,
//  속도가 0이면 브레이크는 더이상 못씀
    function breakCar() public {
        require(/*myCar.speed != 0 &&*/ myCar.status != carStatus.turnedOff && myCar.status != carStatus.stop);
        myCar.speed--;
        myCar.fuelGuage--;
        if(myCar.speed == 0) {
            myCar.status = carStatus.stop;
        }

        if(myCar.fuelGuage == 0) {
            myCar.status = carStatus.outOfFuel;
        }
    }

// * 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
    function stopTheEngine() public {
        require(myCar.speed == 0 && myCar.status != carStatus.turnedOff || myCar.fuelGuage == 0);
        if(myCar.speed != 0) {
            myCar.speed == 0;
        }
        myCar.status = carStatus.turnedOff;
    }


// * 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
    function startTheEngine() public {
        require(myCar.status == carStatus.turnedOff && myCar.fuelGuage > 0);
        myCar.status = carStatus.stop;
    }

// 기름이 0일 때 자동 정지 기능
    

// * 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨

// 지불은 smart contract에게 함.
    
    // function reCharge() public payable{
    //     require(msg.value == 10**18 && myCar.status != carStatus.stop);
    //     myCar.fuelGuage = 100;
    // }

    function reCharge() public payable {
       require(((prePaid >= 10**18 && msg.value ==0) || msg.value == 10**18) && myCar.status == carStatus.turnedOff);
        /*
        prePaid 1 이상, msg.value = 0
        prePaid 1 이상, msg.value = 1 fin
        prePaid 1 이하, msg.value = 1 fin
        prePaid 1 이하, msg.value = 1 eth
        */

        
        /*
        prePaid 1이더 이상, msg.value 1이더 turnedOff
        prePaid 1이더 이하, msg.value 1이더 turnedOff
        prePaid 1이더 이하, msg.value 1이더 이하 turnedOff
        prePaid 1이더 이상, msg.value 1이더 turnedOff (x)
        prePaid 1이더 이하, msg.value 1이더 turnedOff (x)
        prePaid 1이더 이하, msg.value 1이더 turnedOff 이하 turnedOff (x)
        */

        if(msg.value != 10**18) {
            prePaid -= 10**18;
        }

        myCar.fuelGuage = 100;
    }

// ----------------------------------------------------------------------------------------
// * 주유소 사장님은 2번 지갑의 소유자임, 주유소 사장님이 withdraw하는 기능
    function withDraw() public {
        require(owner == msg.sender);
        owner.transfer(address(this).balance);
    }
    uint public prePaid;
// * 지불을 미리 하고 주유시 차감하는 기능 
    // uint prePaid;

    // function deposit() public payable {
    //     prePaid = msg.value;
    // }

}

contract A {

    uint public a;
    uint public b;
    uint public c;
    uint public d;

    function setABCD(uint _a, uint _b, uint _c, uint _d) public {
        (a,b,c,d) = (_a, _b, _c, _d); 
    }

    function ABC() public returns(string memory) {
        require(a ==0 && b != 1 || c ==0);
        /*
        a=0 b=2 c=2 <- 앞의 조건 2개 만족, 뒤의 조건 불만족 -> o
        a=0 b=1 c=0 <- 앞의 조건 1개 만족, 뒤의 조건 만족 -> o
        a=0 b=1 c=1 <- 앞의 조건 1개 만족, 뒤의 조건 불만족 -> x
        a=1 b=1 c=0 <- 앞의 조건 0개 만족, 뒤의 조건 만족 -> o
        a=1 b=1 c=1 <- 모두 불만족 -> x
        */
        return "aaa";
    }

    function ABC2() public view returns(string memory) {
        require(a ==0 || b != 1 && c ==0);
        /*
        (a // b,c)
        (a,b // c)
        (a,c // b)
        a=0, b=1, c=1 <- a만 만족 -> o
        a=1, b=2, c=1 <- b만 만족 -> x
        a=1, b=1, c=0 <- c만 만족 -> x
        a=0, b=2, c=1 <- a,b 만족 -> o
        a=0, b=1, c=0 <- a,c 만족 -> o 
        a=1, b=2, c=0 <- b,c 만족 -> o
        */
        return "aaa";
        /*
        0,0,0, -> o
        */
    }

    function ABCD() public view returns(string memory) {
        require(a ==0 || b != 1 && c ==0 || d==0);
        /*
        a=0, b=1, c=1, d=1 <- a만 만족 -> o
        a=1, b=0, c=1, d=1 <- b만 만족 -> x
        a=1, b=1, c=0, d=1 <- c만 만족 -> x
        a=1, b=1, c=1, d=0 <- d만 만족 -> o 
        a=0, b=0, c=1, d=1 <- a,b만 만족 -> o
        a=0, b=1, c=0, d=1 <- a,c만 만족 -> o
        a=0, b=1, c=1, d=0 <- a,d만 만족 -> o
        a=1, b=0, c=0, d=1 <- b,c만 만족 -> o
        a=1, b=0, c=1, d=0 <- b,d만 만족 -> o
        a=1, b=1, c=0, d=0 <- c,d만 만족 -> o
        a=0, b=0, c=0, d=1 <- a,b,c만 만족 -> 
        a=0, b=0, c=1, d=0 <- a,b,d만 만족 -> o
        a=0, b=1, c=0, d=0 <- a,c,d만 만족 -> o
        a=1, b=0, c=0, d=0 <- b,c,d만 만족 -> o
        */

        return "aaa";
    }
}

contract B {
    function deposit() public payable {}

    uint eth = 1 ether;

    function transferTo(address payable _to, uint amount) public {
        _to.transfer(amount * eth);
    }
}

contract C1 {
    function deposit() public payable{}
    receive() external payable{}
}

contract C2 {
    function deposit() public payable{}
}