//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Property{
    uint public price;
    address public owner;

    constructor(){
        owner = msg.sender;
        price = 0;
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    function changeOwner(address _owner) public onlyOwner{
        owner = _owner;
    }

    function changePrice(uint _price) public onlyOwner{
        price = _price;
    }
}