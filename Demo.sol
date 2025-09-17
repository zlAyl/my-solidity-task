// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Demo {
    
    function getSender() public view returns (address) {
        return msg.sender;
    }

    function getOrigin() public view returns (address){
        return tx.origin;
    }
}

contract Demo1 {
    //0x9d83e140330758a8fFD07F8Bd73e86ebcA8a5692
    //0x9d83e140330758a8fFD07F8Bd73e86ebcA8a5692
    Demo demo;
    constructor() {
        demo = new Demo();
    }

    function getSender() public view returns (address) {
        return demo.getSender();
    }

    function getOrigin() public view returns (address){
        return demo.getOrigin();
    }

}