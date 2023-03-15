//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Lottery{
    address payable[] public players;
    address manager;

    constructor(){
        manager=msg.sender;
    }

    receive() external payable{
        require(msg.value == 0.01 ether,"Lottery value is 0.01 ether only!!");
        require(msg.sender != manager,"Manager can not take part in lottery!!");
        players.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        require(msg.sender == manager,"Only Manager can see balance!!");
        return address(this).balance;
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }

    function pickWinner() public{
        require(msg.sender == manager,"Only Manager can pick winner!!");
        require(players.length >= 3,"Insufficient number of participents");
        uint x = random();
        uint i = x % players.length;
        address payable winner;
        winner = players[i];
        winner.transfer(getBalance());
        players = new address payable[](0);
    }
}