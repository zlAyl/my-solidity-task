// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20 {

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);

    mapping (address => uint256) private _balances; //余额

    mapping(address => mapping(address => uint256)) private _allowance; //授权映射

    address public _owner; //合约所有者

    constructor() {
        _owner =msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == _owner, "Only owner can call this function");
        _;
    }
    
     //查询余额
     function balanceOf(address account) external view returns (uint256){
            return _balances[account];

     }

     //转账
     function transfer(address to, uint256 value) external returns (bool){
            require(to != address(0), "ERC20: transfer to the zero address");
            require(_balances[msg.sender] >= value , "ERC20: insufficient balance");
            _balances[msg.sender] -= value;
            _balances[to] += value;
            emit Transfer(msg.sender, to, value);
            return true;
     }

    //授权
     function approve(address spender, uint256 value) external returns (bool){
            require(spender != address(0), "Approve to the zero address");
            _allowance[msg.sender][spender] = value;
            emit Approval(msg.sender, spender, value);
            return  true;
     }

    //查询授权额度
    function allowance(address owner, address spender) external view returns (uint256){
        return _allowance[owner][spender];
    }

    //代扣转账
     function transferFrom(address from, address to, uint256 value) external returns (bool){
            require(from != address(0), "Transfer from the zero address");
            require(to != address(0), "Transfer to the zero address");
            require(_balances[from] >= value, "Insufficient balance");
            require(_allowance[from][msg.sender] >= value, "Insufficient allowance");
            
            _balances[from] -= value;
            _balances[to] += value;
            _allowance[from][msg.sender] -= value;
            emit Transfer(msg.sender, to, value);
            return true;
    }

    
    //增发代币（只有所有者可以调用）
    function mint (address to, uint256 amount) public onlyOwner {
            require(amount > 0, "Amount must be positive");
            _balances[to] += amount;
            emit Transfer(address(0), to, amount);
    }
}