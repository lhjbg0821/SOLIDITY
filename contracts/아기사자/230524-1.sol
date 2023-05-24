// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract A {
// 1.
// 월 과 일을 input 값으로 받아서 이 날짜가 1년중 몇번쨰 날인지를 반환해주는 함수를 만드시오.

    uint[12] daysInMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
    
    function dateToUint(uint _month, uint _day) public view returns(uint) {
        require(_day>0 && _day<=31 && _month<=1 && _month <=12);
        uint dayOfYear = _day;

        for (uint i=1; i<daysInMonth[_month]; i++) {
            dayOfYear += daysInMonth[i-1];
        }
        return dayOfYear;
    }
}

contract B {
// 2.
// 호텔을 예약하려 합니다. 이름, 방번호, 사람 수가 들어간 구조체를 만드세요.
    struct Hotel {
        string name;
        uint roomNum;
        uint countPerson;
    }
    Hotel[] hotels;
    address payable owner;
// 방의 상태는 예약 가능과 예약됨으로 되어있습니다.

// bool 초기 상태 : 예약 가능 - true
    bool roomState = true;
// 이름을 통해 예약자 명단을 확인할 수 있습니다.
    mapping(string=>Hotel) name_hotel;

// * 예약하기 - 각 정보를 기입해 예약할 수 있는 함수를 만드세요.
//   예약금은 1 ether이며 예약 시 예약됨으로 변경되어야 합니다.
    function setReserve(string memory _name, uint _roomNum, uint _countPerson) public payable {
        require(msg.value > 1 ether);
        hotels.push(Hotel(_name, _roomNum, _countPerson));
        name_hotel[_name] = Hotel(_name, _roomNum, _countPerson);
        owner.transfer(1 ether);
        roomState == false;
    }

// * 예약 조회 - 이름을 통해 예약을 조회할 수 있는 함수를 만드세요.
    function getReserve(string memory _name) public view returns(Hotel memory) {
        return name_hotel[_name];
    }
// * 예약 취소 - 예약자 명단에서 지우고 예약시 지불금의 70%를 반환하는 함수를 구하세요.
    function cancelReserve(string memory _name) public {
        delete name_hotel[_name];
        payable(msg.sender).transfer(0.7 ether);
    }

}

contract C {
    // 3.
// A스마트 컨트랙트의 주인은 owner입니다.
    address payable owner;
// owner가 A컨트랙트로부터 출금할 수 있는 기능을 만들고자 합니다.
// 위 출금 함수는 A컨트랙트의 주소 16진수 중 0x 다음 첫글자가 숫자로 시작하면 1ether,
// 아니면 2ether를 출금되도록 합니다.
    function pay() public {
        if(/*0x 다음 첫글자가 숫자로 시작하면 1ether*/) {
            owner.transfer(1 ether);
        } else {
            owner.transfer(2 ether);
        }
    }
}