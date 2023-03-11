// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Deposite{
    address public owner;

    constructor(){
        owner = msg.sender;
    }
    receive() external payable{
    }

    fallback() external payable{
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function sendEther() public payable{

    }

    function transferEther(address payable recepient, uint amount) public returns(bool){
        require(owner == msg.sender,"Transfer fails, you are not the owner!!");
        if(amount <= getBalance()){
            recepient.transfer(amount);
            return true;
        }
        return false;
    }
}