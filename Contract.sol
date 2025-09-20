// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
     uint immutable  public  maxBalance;

    constructor(uint _maxBalance) {
        maxBalance = _maxBalance;
    }

    event testEvent(uint);

    function test() public  {
        uint a = 1;
        emit testEvent(a);
    }
}

contract ModifierExample {
    address public owner;
    constructor()  {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }
    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}