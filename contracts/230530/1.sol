// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract SAME {
    uint[] a = [1,2,3,4];
    string[] b = ["a", "b"];

    function isSameNumber(uint[] calldata _myNumber) public view returns(uint) {
        uint count;

        for(uint i=0; i<a.length; i++) {
            if(a[i] == _myNumber[i]) {
                count++;
            }
        }
        return count;
    }

    function isSameLetter(string[] calldata _myLetter) public view returns(uint) {
        uint count;
        for(uint i=0; i<_myLetter.length; i++) {
            if(letterCompare(b[i], _myLetter[i])) {
                count++;
            }
        }
        return count;
    }

    function letterCompare(string memory _a, string memory _b) public pure returns(bool) {
        return keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked(_b));
    }
}

contract BytesCompare {
    bytes1 a = 0x12;
    bytes1 b = 0x23;

    function compare() public view returns(bool) {
        return b>a;
    }

    function compare2(bytes1 _a, bytes1 _b) public pure returns(bool) {
        return _b>_a;
    }

    // bytes나 string은 안됨
    // function compare3(bytes memory _a, bytes memory _b) public pure returns(bool) {
    //     return _b > _a;
    // }

    function bytes1ToUint(bytes1 _a) public pure returns(uint8) {
        return uint8(_a);
    }

    function uintToBytes1(uint8 _a) public pure returns(bytes1) {
        return bytes1(_a);
    }

    function bytesAdd() public view returns(bytes1) {
        return bytes1((uint8(a) + uint8(b))/2);
    }
}

contract BytesVsABI {
    function bytes_1(string memory _a) public pure returns(bytes memory) {
        return bytes(_a);
    }

    function ABI_1(string memory _a, uint _b) public pure returns(bytes memory) {
        return abi.encodePacked(_a, _b);
    }
}