// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

// 정확히 어떤 부모에서 상속된건지 제대로 알기ㅣ! 
contract VISIBILITY {
    function add(uint a, uint b) public pure returns(uint) {
        return a+b;
    }

    function publicF() public pure returns(string memory) {
        return "public";
    }

    function privateF() private pure returns(string memory) {
        return "private";
    }

    function testPrivateF() public pure returns(string memory) {
        privateF();
    }

    function internalF() internal pure returns(string memory) {
        return "internal";
    }

    function testInternalF() public pure returns(string memory) {
        internalF();
    }

    function externalF() external pure returns(string memory) {
        return "external";
    }
}

// contract Child is Visibility {
//     function testInternal2() public pure returns (string memory) {
//         return internal();
//     }
//     function testPublic() public pure returns (string memory) {
//         return public();
//     }
// }


contract Dad {
    uint a;

    uint public wallet; // 공개한 지갑 잔액
    uint internal crypto; // 메모장에 private key가 있는 지갑 잔액
    uint private emergency; // 진짜 비상금 

    function add(uint a, uint b) public pure returns(uint) {
        return a+b;
    }
}

contract Mom {
    DAD husband = new DAD();
    function sub(uint a, uint b) public pure returns(uint) {
        return a-b;
    }
}

// 여기에서 Parent에 있는걸 그대로 상속받겠다는 의미
contract Child is Dad{  
    function mul(uint a, uint b) public pure returns(uint) {
        return a*b;
    }

    function mul2(uint a, uint b) public pure returns(uint) {
        return a*a*b;
    }

    function addDoubleTime(uint a, uint b) public pure returns(uint) {
        return Dad.add(a,b)*2;
    }
}   

contract Child2 is Dad, Mom{  
    function mul(uint a, uint b) public pure returns(uint) {
        return a*b;
    }
}   

contract GrandChild is Child {  
    function div(uint a, uint b) public pure returns(uint) {
        return a/b;
    }
}   

contract GrandChild2 is Child {
    function mul3(uint a, uint b) public pure returns(uint) {
        return a*a*b;
    }
}

contract DAD {
    function who() virtual  public pure returns(string memory) {
        return "dad from DAD";
    }

    function name() internal pure returns(string memory) {
        return "David";
    }

    function cal(uint a) public pure returns(uint) {
        return a*2;
    }

    function password() private pure returns(uint) {
        return 1234;
    }

    function character() external pure returns(string memory) {
        return "not good";
    }
}

contract MOM {
    function who() virtual  public pure returns(string memory) {
        return "mom from MOM";
    }
}

contract CHILD is DAD {
    function who() override  public pure returns(string memory) {
        return "child from CHILD";
    }

    function fathersName() public pure returns(string memory) {
        return super.name();
    }

    function cal_Dad(uint _b) public pure returns(uint) {
        return super.cal(_b);
    }

    // function password_Dad() public pure returns(uint) {
    //     return super.password();
    // }

// 상속받은 애라서 external도 안됨 외부가 아니니까
    // function fatherChar() public pure returns(string memory) {
    //     return super.charcter();
    // }
}

contract CHILD2 is DAD, MOM {
    function who() virtual  override(DAD, MOM) public pure returns(string memory) {
        return super.who();
        // return "child from CHILD";
    }
}

contract CHILD2_2 is MOM, DAD {
    function who() virtual  override(MOM, DAD) public pure returns(string memory) {
        return super.who();
        // return "child from CHILD";
    }
}

contract CHILD3 is DAD {
    function who() override public pure returns(string memory) {
        return "child from CHILD";
    }

    function who(uint a) public pure returns(string memory, uint) {
        return ("dad from CHILD", a);
    }
}

contract GRANDCHILD is CHILD2 {
    function who() override public pure returns(string memory) {
        return "grandchild";
    }
}