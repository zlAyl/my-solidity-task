// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Functions {

    //函数选择器
    //bytes4 demo = bytes4(keccak256("test(x)"));

    //内置函数选择器
    //bytes4 demo1 = this.test.selector;

    uint public count;
    bytes4 storedSelector;
    //求一个数的平方
    function square(uint x) external pure  returns(uint){
        return x * x;
    }

    //求一个数的两倍
    function double(uint x) external  pure  returns (uint){
        return 2*x;
    }

    function getSquareSelector() public pure  returns (bytes4){
        return this.square.selector;
    }

    function getDoubleSelector() public pure  returns (bytes4){
        return this.double.selector;
    }

    function executeFunction(bytes4 selector, uint x) private   returns (uint z)  {
       (bool success, bytes memory data) =  address(this).call(abi.encodeWithSelector(selector, x)) ;
       require(success, "Function call failed");

       z = abi.decode(data, (uint));
    }

    function storeSelector(bytes4 selector) public {
        storedSelector = selector;
    }

    function executeStoredFunction(uint x) public  {
        require(storedSelector != bytes4(0), "Selector not set");
        count = executeFunction(storedSelector, x);
          
    }
 
}