// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

contract TEST7 {
    function setTime(uint _n) public pure returns(uint, uint, uint) {
        uint hour = _n/3600;
        uint minute = (_n%3600) / 60;
        uint second = _n%60;
        return(hour, minute, second);
    }
}

contract CONCAT {
    function concat1(string memory a, string memory b) public pure returns(string memory) {
        return string(abi.encodePacked(a, b));
    }

    function concat2(string memory a, string memory b) public pure returns(string memory) {
        return string.concat(a,b);
    }

    function concat3(uint a, string memory b, string memory c) public pure returns(string memory) {
        return string(abi.encodePacked(a, b, c));
    }
    
    function rturnEncodePacked(uint a, string memory b) public pure returns(bytes memory, bytes memory) {
        return(abi.encodePacked(a), abi.encodePacked(b));
    
    }

    function concat4(uint a, uint b, uint c) public pure returns(string memory) {
        a = a+48;
        b = b+48;
        c = c+48;
        return string(abi.encodePacked(a, b, c));
    }

    Q5 q5 = new Q5();
    function concat5(uint a) public view returns(string memory) {
 
        uint b = q5.getLength(a);
        uint[] memory c = new uint[](b);
        c = q5.divideNumber(a);
        for(uint i=0; i<c.length; i++) {
            c[i] += 48;
        }
        return string(abi.encodePacked(c));
    }
    
    function concat6(uint a, string memory b) public view returns(string memory) {
        return string(abi.encodePacked(concat5(a), "hours", b));
    }
}

contract Q5 {
    function divideNumber(uint _n) public pure returns(uint[] memory) {
        uint[] memory b = new uint[](getLength(_n));

        uint i=getLength(_n);
        while(_n !=0) {
            b[--i] = _n%10;
            _n = _n/10;
        }
        return (b);
    }

    function getLength(uint _n) public pure returns(uint) {
        if(_n==0) {
            return 1;
        }

        uint a;
        while(_n >= 10**a) {
            a++;
        }
        return a;
    }
}

contract CONCAT2{
    Q5 q5 = new Q5();
    TEST7 q7 = new TEST7();

    function concat(uint a) public view returns(string memory) {
        uint b = q5.getLength(a);
        uint[] memory c = new uint[](b);
        c = q5.divideNumber(a);
        for(uint i=0; i<c.length; i++) {
            c[i] += 48;
        }
        return string(abi.encodePacked(c));
    }

    function getConcat(uint _n) public view returns(string memory) {
        return string(abi.encodePacked(concat(_n), "hours"));
    }

    function concat6(uint _n) public view returns(uint, uint, uint /*string memory*/) {
        (uint a, uint b, uint c) = q7.setTime(_n);
        return (a,b,c);
    }

    function concat7(uint _n) public view returns(string memory) {
        (uint a, uint b, uint c) = q7.setTime(_n);
        return string(abi.encodePacked(concat(a),"hours ", concat(b), "minutes ", concat(c), "seconds"));
    }
}