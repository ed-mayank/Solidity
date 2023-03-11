// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract globalVariables{
    address public owner;
    uint public sentValue;

    constructor(){
        owner=msg.sender;
    }

    function changeOwner() public{
        owner=msg.sender;
    }

    function sendEther() payable public{
        sentValue=msg.value;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function howMuchGas() public view returns(uint){
        uint start = gasleft();
        uint j=1;
        for(uint i=0;i<20;i++){
            j *= i;
        }
        uint end = gasleft();
        return start-end;
    }

    uint public timestamp = block.timestamp;
    uint public blockNumber = block.number;
    uint public difficulty = block.difficulty;
    uint public gaslimit = block.gaslimit;
}