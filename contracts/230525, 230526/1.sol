// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.18;

// 은행에 입금을 하면 진짜 돈이 빠져나가는 case 

contract APP {
    mapping(address => uint) balance; // 개인 잔액 
    mapping(address => mapping(address => uint)) bankAccount; // 은행 잔고 
    receive() external payable{}

    modifier balanceCheck(address _a, uint _amount) {
        require(balance[_a] >= _amount);
        _;
    }

    // 입금 - 해당 APP에게 얼만큼의 돈을 입금하겠다.
    function depositToApp() public payable{
        balance[msg.sender] += msg.value;
    }

    // 입금 - 특정 은행에게 얼만큼의 돈을 입금하겠다. 
    function depositToBank(address payable _bank, uint _amount) public {
        Bank targetBank = Bank(_bank);
        require(balance[msg.sender] >= _amount);
        payable(targetBank).transfer(_amount);
        balance[msg.sender] -= _amount;
        targetBank.Deposit(msg.sender, _amount);
    }

    // 인출 - 해당 App에게 얼만큼의 돈을 출금하겠다.
    function withdrawFromApp(uint _amount) public balanceCheck(msg.sender, _amount){
        balance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    // 인출 - 특정 은행에서 얼만큼의 돈을 출금하겠다.
    function withdraw(address payable _bank, uint _amount) public {
        Bank targetBank = Bank(_bank);
        targetBank.Withdraw(msg.sender, _amount);
        balance[msg.sender] += _amount;
    }
    
    // 송금 - A가 B에게 돈을 보내는 것 (직접) 
    function transferTo(address _bAccount, uint _amount) public balanceCheck(msg.sender, _amount) {
        balance[msg.sender] -= _amount;
        balance[msg.sender] += _amount;
    }

    // 은행송금 - A의 은행에서 B의 은행에게 돈을 보내는 것 (은행끼리) 
    function transferWire(address _aBank, address _bAccount, address _bBank, uint _amount) public {
        // withdrawFromBank(_aBank, _amount);
    }
}

// Bank가 쉬우니까 여기부터 진행 !!
contract Bank {
    mapping(address => uint) public balance;
    receive() payable external{}

    // 잔고 확인 
    function balanceOf(address _account) public view returns(uint)  {
        require(_account == msg.sender);
        return balance[msg.sender];
    }

    // function balanceOf(address _account) public view returns(uint)  {
    //     require(_account == msg.sender);
    //     return balance[_account];
    // }

    // 입금 - 얼만큼의 돈을 입금하겠다. 
    // 컨트랙트 자체가 은행이기 때문에 얼만큼의 돈을 입금하겠다는 amount만 필요 
    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    // internal은 payable 안됨!!
    function _deposit(address _account, uint _amount) internal {
        balance[_account] += _amount;
    }

    function Deposit(address _account, uint _amount) public {
        require(_amount != 0, "Account should not be zero.");
        _deposit(_account, _amount);
    }

    // 인출 - 얼만큼의 돈을 출금하겠다.
    function withdraw(uint _amount) public {
        balance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function _withdraw(address _account, uint _amount) internal {
        balance[_account] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function _withdraw2(address _account, uint _amount) public {

    } // 개인 지갑으로 

    function Withdraw(address _account, uint _amount) public {
        require(balance[_account] >= _amount);
        _withdraw(_account, _amount);
    }
    
    // 송금 - A가 B에게 돈을 보내는 것 (동생) 
    function transferTo(address _bAccount, uint _amount) public {
        balance[msg.sender] -= _amount;
        balance[_bAccount] += _amount;
    }

    // 타행송금 - A의 은행에서 B의 은행에게 돈을 보내는 것 (타행) 
    function transferWire(address _bAccount, address payable anotherBank, uint _amount) public {
        Bank B = Bank(anotherBank);
        balance[msg.sender] -= _amount;
        payable(B).transfer(_amount);
        // anotherBank에서의 B의 accountBalance를 높여주기
        B.deposit(); 
    }
}

contract MSGSENDER {
    function A() public view returns(address) {
        address a = msg.sender;
        return a;
    }

    function B() public view returns(address) {
        address b = A();
        return b;
    }

}

contract MSGSENDER2 {
    MSGSENDER msgsender = new MSGSENDER();

    function  C() public view returns(address) {
        address c = msgsender.A();
        return c;
    }

    function D() public view returns(address) {
        address d = msgsender.B();
        return d;
    }
}

contract MSGSENDER3 {
    address[] list;

    function push() public {
        list.push(msg.sender);
    }

    function push2() public {
        push();
    }

    function getList() public view returns(address[] memory) {
        return list;
    }
}

contract AA {
    function numbers() public pure returns(uint, uint, uint) {
        return (1, 2, 3);
    }

    function numbers2() public view returns(uint, uint, uint) {
        (uint a, uint b, uint c) = numbers();
    return (a, b, c);
    }

    function numbers3() public view returns(uint, uint) {
        (uint a, , uint c) = numbers();
        return (a, c);
    }

    
}