// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    mapping(address => uint256) public balances;

    //存款
    function deposit() public payable {
        balances[msg.sender] += msg.value; //从msg.sender这个地址的账户把钱转到当前的合约账户中
    }

    //提取
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance.");
        balances[msg.sender] -= amount; //合约账户扣除需要提取的金额
        payable(msg.sender).transfer(amount); // 把amount金额转移给 msg.sender 这个调用者
    
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function getMyETHBalance() public view returns (uint256) {
        return msg.sender.balance; // 返回调用者的原生ETH余额（单位：wei）
    }

    function getAddress() public view  returns (address){
        return  address(this);
    }

    function destroyContract() public  {
        //selfdestruct(_beneficiary); // 销毁合约，将剩余的以太币发送到指定地址 已经废弃
        payable(msg.sender).transfer(address(this).balance);
       
    }
   
}

contract Demo {
    
    function test() public pure  {
        type(SimpleWallet).name;
        type(SimpleWallet).creationCode;
    }
}