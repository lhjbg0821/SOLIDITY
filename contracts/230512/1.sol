// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2

//1000000000000000000

contract Note {
    address payable owner;
    address a;

    function deposit() public payable returns(uint) {
        return msg.value;
    }

    receive() external payable {}
    fallback() external payable {} 

    function setOwner() public {
        owner = payable(msg.sender); // 거래를 일으킨 사람이 msg.sender
    }

    function getOwner() public view returns(address payable) {
        return owner;
    }

    function setA() public {
        a = payable(msg.sender);
    }

    function getA() public view returns(address){
        return a;
    }

    function transferTo(address payable _to, uint _amount) public {
        _to.transfer(_amount);
    } // 지갑주소.transfer(규모)

    function transferToOwner(uint _amount) public {
        owner.transfer(_amount);
    }

    // function transferToA(uint _amount) public {
    //     a.transfer(_amount);
    // }



}