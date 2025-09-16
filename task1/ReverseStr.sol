// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ReverseStr {

    //反转字符串
    function reverseStr(string memory str) public pure  returns (string memory){
        bytes memory bs = bytes(str);

        uint256 n = bs.length;

        for (uint256 i=0; i<n/2; i++){
            bytes1 temp = bs[i];
            bs[i] = bs[n-1-i];
            bs[n-1-i] = temp;
        }
        return string(bs);
    }
}