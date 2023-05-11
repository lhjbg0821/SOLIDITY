// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract Review1 {
    mapping(uint => uint) setNum;
    mapping(string => uint) srtToNum;

    struct Wallet{
        string name;
        uint number;
        address wallet;
    }

    mapping(string => Wallet) strToWallet;

    Wallet[] wallets;

    function setWallet(string memory _name, uint _number, address _account) public {
        wallets.push(Wallet(_name, _number, _account));
    }

    function getWallet(uint _n) public view returns(Wallet memory) {
        return wallets[_n-1];
    }

    function getAddress(uint _n) public view returns(address) {
        return wallets[_n-1].wallet;
    }

    function getAllWallet() public view returns(Wallet[] memory) {
        return wallets;
    }
}

contract Review2 {
    uint count;
    uint[10] Num1;
    uint[] Num2;

    function pushNum1(uint _n) public {
        Num1[count++] = _n;
    }

    function pushNum2(uint _n) public {
        Num2.push(_n);
    }

    function addNum1() public view returns(uint) {
        uint sum;
        for (uint i=0; i<Num1.length;i++){
            sum += Num1[i];
        }
        return sum;
    }
}