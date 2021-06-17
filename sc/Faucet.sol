pragma solidity ^0.4.22;

contract owned {
    address owner;

    // 컨트랙트 생성자 owner 설정
    constructor() {
        owner = msg.sender;
    }

    // 변경자 접근 제어
    modifier onlyOwner {
        require(msg.sender == owner, "Only the contract owner can call this Function");
        _;
    }
}

contract mortal is owned {
    // 컨트랙트 소멸자
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}

contract Faucet is mortal {
    event Withdrawal(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);  
 
    // 요청하는 사람 이더전송(출금)
    function withdraw(uint withdraw_amount) public {
        require(withdraw_amount <= 0.1 ether);
        require(this.balance >= withdraw_amount, "Insufficient balance in faucet for withdrawal request");
        msg.sender.transfer(withdraw_amount);
        emit Withdrawal(msg.sender, withdraw_amount);
    }
    // 입금 금액 수락
    function () public payable{
        emit Deposit(msg.sender, msg.value);
    }
}
