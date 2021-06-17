pragma solidity ^0.4.22;

contract Faucet {

    address owner;

    // Faucet 컨트랙트 초기화: owner 설정
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    function withdraw(uint withdraw_amount) public {
        require(withdraw_amount <= 0.1 ether);
        msg.sender.transfer(withdraw_amount);
    }
    
    function () public payable{}
}
