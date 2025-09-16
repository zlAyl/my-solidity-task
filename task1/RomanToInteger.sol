// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract RomanToInt {

    function romanToInt (string memory str) public pure  returns(uint256){
        uint256 result = 0;
        uint256 length = bytes(str).length;
        
        for (uint256 i = 0; i < length; i++) {
            uint256 current = getValue(bytes(str)[i]);
            
            // 如果当前值小于下一个值，则减去当前值
            if (i < length - 1 && current < getValue(bytes(str)[i + 1])) {
                result -= current;
            } else {
                // 否则加上当前值
                result += current;
            }
        }
        
        return result;
        
    }

     // 辅助函数：获取单个罗马数字字符的值
    function getValue(bytes1 c) private pure returns (uint256) {
        if (c == 'I') return 1;
        if (c == 'V') return 5;
        if (c == 'X') return 10;
        if (c == 'L') return 50;
        if (c == 'C') return 100;
        if (c == 'D') return 500;
        if (c == 'M') return 1000;
        // 如果输入了无效字符，返回0
        return 0;
    }
}