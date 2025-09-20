// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Block {
    
    //返回指定区块的哈希值
   bytes32 hash =  blockhash(100);

   //返回挖出当前区块的矿工地址
   address addr = block.coinbase;

   //返回当前区块的难度
   //uint diff = block.difficulty;

   //返回当前区块的 Gas 上限。
   uint gas = block.gaslimit;

    //返回当前区块号
   uint num = block.number;

   //返回当前区块的时间戳
   uint timestamp = block.timestamp;

   //返回当前合约执行剩余的 Gas 数量
   uint remainingGas = gasleft();

   //返回当前调用的完整 calldata
    bytes  data = msg.data;

    //返回此次调用发送的以太币数量
    uint sentValue = msg.value;

    address origin = tx.origin;

    address owenr = msg.sender;

    receive() external payable { }
    
    fallback() external payable{}

// 触发fallback() 还是 receive()?
//            接收ETH
//               |
//          msg.data是空？
//             /  \
//           是    否
//           /      \
// receive()存在?   fallback()
//         / \
//        是  否
//       /     \
// receive()   fallback()
   
}