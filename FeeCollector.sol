// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector{
    address public owner;
    uint256 public balance;

    constructor(){
        owner = msg.sender;
    }

    receive() payable external {
        balance += msg.value;
    }

    function withdraw(uint256 _amount,address payable destAddr) public {
        require(msg.sender==owner,"Only owner can withdraw.");
        require(_amount <= balance,"Insufficient funds");
        destAddr.transfer(_amount);
        balance -= _amount;
    }
}
