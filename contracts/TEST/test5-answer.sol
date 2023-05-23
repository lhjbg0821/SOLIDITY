// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract TEST5_answer {
    function divid(uint _n) public pure returns(uint, uint[] memory) {
        uint a = getLength(_n);
        uint[] memory b = new uint[](10);

        uint i;
        while(_n != 0) {
            b[i] = _n%10;
            _n = _n/10;
        }
        return (getLength(_n), b);
    }

    function getLength(uint _n) public pure returns(uint) {
        // for(uint i=0; /*조건문 비우기*/ ;i++) {
        //     if(_n<10**i) {
        //         return i;
        //     }
        // }

        uint a;
        while(_n > 10**a) {
            a++;
        }
        return a;
    }
}

contract BYTES_LENGTH {
    function getLength1(bytes1 a) public pure returns(uint) {
        return a.length;
    }

    function getLength2(bytes2 a) public pure returns(uint) {
        return a.length;
    }

    function getLength3(bytes3 a) public pure returns(uint) {
        return a.length;
    }

    function getLength4(bytes3 a) public pure returns(uint) {
        return a.length;
    }

    function bytes1ToString(bytes1 a) public pure returns(string memory) {
        string memory _a = string(abi.encodePacked(a));
        return _a;
    }

    function bytesToBytes1Array(bytes memory _bytes) public pure returns(bytes1[] memory) {
        bytes1[] memory _bytes1 = new bytes1[](_bytes.length);
        for(uint i=0; i<_bytes.length; i++) {
            _bytes1[i] = _bytes[i];
        }
        return _bytes1;
    }

    function stringToBytes1Array(string memory _string) public pure returns(uint, string[] memory, string[] memory) {
        bytes1[] memory b_array = new bytes1[](bytes(_string).length);
        b_array = bytesToBytes1Array(bytes(_string));

        string[] memory s_array = new string[](b_array.length);

        for(uint i=0; i<b_array.length; i++) {
            s_array[i] = string(abi.encodePacked(b_array));
        }

        return (s_array.length, s_array, string(abi.encodePacked(b_array)));
    }
}

contract BYTESTOSTRING {
    function bytes1ToString(bytes1 a) public pure returns(string memory) {
        string memory _a = string(abi.encodePacked(a));
        return _a;
    }
}