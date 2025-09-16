// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MergeArr {
    uint[] public u = [1, 2, 3]; 
    function merge(uint[] memory a, uint[] memory b) public pure returns (uint[] memory) {
       uint[] memory c = new uint[](a.length + b.length);
    //    uint8[] memory d = [1,2,3,4]; 不能这样写
    //    uint256[] memory u = [1, 2, 3];  不能这样写 内存中得数组不能使用push和pop 长度必须固定
    //    uint[] memory k = new uint[](4); // 这样写才行
    //    k[0] = 1;
        // string[3] memory s = ["1","2","3"];
        // uint8[4] memory d = [1,2,3,4]; 
        for (uint i =0; i<a.length; i++) {
            c[i] = a[i];
        }
        for (uint i=0;i<b.length;i++) {
                c[a.length+i] = b[i];
        }
        return c;
    }
}