// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract INITIALIZATION {
    uint a;
    string b;
    address c;
    bytes1 d;
    bytes e;
    bool f;

    struct set1 {
        uint a;
        string b;
        address c;
        bytes1 d;
        bytes e;
        bool f;
    }

    set1 public S1;
    set1[] group1;

    uint[] g;
    string[] h;
    bytes1[4] i;
    uint[4] j;
    address[4] k;
    string[4] l;

    struct set2 {
        uint[] g;
        string[] h;
        bytes1[4] i;
        uint[4] j;
        address[4] k;
        string[4] l;
    }

    set2 s2;
    set2[] group2;

    function pushG1() public {
        group1.push(set1(0,"", address(0), 0x00, new bytes(0), false));
    }

    function pushG2() public {
        bytes1[4] memory _i;
        group2.push(set2(new uint[](0),new string[](0), _i));
    }

    function getG2() public  view returns(set2[] memory) {
        return group2; // 0: tuple(uint256[],string[],bytes1[4])[]:
    }

    function getA() public view returns(uint, string memory, address, bytes1, bytes memory, bool) {
        return (a, b, c, d, e, f);
    }

    function getG() public view returns(uint[] memory, string[] memory, bytes1[4] memory, uint[4] memory, address[4] memory, string[4] memory) {
        return (g, h, i, j, k, l);
    }
}

contract doubleMapping {
    struct user {
        uint number;
        string name;
    }

    uint[] A;
    user B;

    mapping(address=>uint) balance;
    mapping(address=>mapping(string=>uint)) bankAccounts;

    mapping(address=>mapping(string=>user)) bankAccounts2; /*struct와 같은 refernce type 변수는 오직 value로만 사용가능*/
    mapping(string=>mapping(string=>mapping(uint=>user))) bankAccounts3;
    mapping(address=>uint[]) As;
    // mapping(uint[]=>address) As2; /*array역시 key로는 사용할 수 없음*

    function setBalance() public {
        balance[msg.sender] = (msg.sender).balance;
    }

    function setBankAccounts(string calldata _name) public {
        bankAccounts[msg.sender][_name] = 100;
    }

    function setBankAccounts2(string calldata _city, string calldata _state, uint number) public {
        bankAccounts3[_city][_state][number] = B;
    }

    function getbankAccounts(address _addr, string calldata _name) public view returns(uint) {
        return bankAccounts[_addr][_name];
    }
}
