// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Voting {
    mapping (string => uint256) public votesReceived;

    string[] private  names;

    //给某个候选人投票
    function vote(string calldata name , uint256 num) public  {
        if (votesReceived[name] == 0){
            names.push(name);
        }
        votesReceived[name] += num;
    }

    //获取候选人的得票数
    function getVotes(string calldata name) public view  returns (uint256){
           return  votesReceived[name];
    }

    //重置所有候选人的得票数
    function resetVotes() public {
        uint256 count = names.length;
        for ( uint256 i = 0; i < count; i++){
            delete votesReceived[names[i]];
        }
    }
}