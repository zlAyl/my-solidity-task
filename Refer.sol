// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Refer {
    uint[] public arr = [1,2,3,4]; //动态数组
    uint[] public  arr2 = arr;
    uint[4] public   arr5 = [1,2,3]; //定长数组

    uint[] public data;

    function updateData(uint[] memory newData) public {
        data = newData;
    }

    function getData() public view  returns(uint[] memory)  {
        return data;
    }

    function modifyStorageData(uint index, uint value) public {
        require(index < data.length, "Index out of bounds");
        data[index] = value;
    }

    function modifyMemoryData(uint[] memory memData) public pure returns (uint[] memory){
         if (memData.length > 0) {
            memData[0] = 999; // 修改memory中的值，开销较小
        }
    
        return memData;
    }

    function test() public  pure   {
        uint[10] memory arr3; // 内存中的定长数组
        arr3[0] = 1;
        arr3[1] = 2;

        //下面这种声明虽然可以编译通过 但是运行时会报错
        // uint[] memory arr6;
        // arr6[0] =1;
        // arr6[1] =2;

        uint[] memory arr7 = new uint[](10);
        arr7[0] =1;
        arr7[1] =2;

        //arr3 和 arr7的本质区别

        //arr3 定长数组 编译时就知道大小和布局
        //在栈上直接分配10个连续的内存槽
        //内存地址：从某个基地址开始连续10个位置
        //内存布局：[arr3[0] | arr3[1] | ... | arr3[9]]
        //一次性分配内存，成本固定


        //arr7 动态数组  运行时决定大小
        //在栈上存储一个指针（指向数据实际位置）
        //数据存储在另外分配的堆内存中
        //内存布局：栈: [指针] → 堆: [长度 | arr7[0] | arr7[1] | ... | arr7[9]]
        //需要计算哈希、分配额外内存，成本更高


    }

    function getFullArray() public view returns (uint[] memory) {
        return arr; // 这样可以返回整个数组
    }

    function test2(uint[] memory array) public {
        arr = array;

        uint[] memory array2 =  new uint[](8);
        arr = array2;

         //uint[] storage y = arr;
    }

}