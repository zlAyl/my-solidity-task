// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntegerToRoman {

    string[] private  symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
    
    uint[] private    values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    
    function intToRoman(uint256 num) public view  returns (string memory) {
        // if (num < 1 || num > 3999) {
        //     revert("Invalid input: num must be between 1 and 3999");
        // }
        require(num > 0 && num <=3999,"Invalid input: num must be between 1 and 3999");
    
        string memory romanNumeral = "";

        for (uint256 i = 0; i < values.length; i++) {
            while (num >= values[i]) {
                romanNumeral = string(abi.encodePacked(romanNumeral, symbols[i]));
                num -= values[i];
            }
            // 如果数字已经减为0，提前退出循环
            if (num == 0) {
                break;
            }   
        }
        return romanNumeral;
    }

}