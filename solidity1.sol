// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract Property{
    /*
    //declaring state variables stored in contract's storage
    int price;  // by default private
    string public location;

    // immutables can be initilized at declaration or in constructors only.
    address immutable public owner;

    // constants can be initilized only during the declaration
    int constant public area = 100;

    bool public sold;

    //Fixed sized array
    uint[5] public numbers=[5,6,3,8,9];

    bytes1 public b1;
    bytes2 public b2;
    bytes3 public b3;

    constructor(int _price, string memory _location){
        price=_price;
        location=_location;
        owner=msg.sender;
    }

    //setter function
    function setPrice(int _price) public{
        price = _price;
    }

    function setLocation(string memory _location) public{
        location = _location;
    }

    function setArrayElement(uint index, uint value) public{
        numbers[index]=value;
    }

    //getter function
    function getPrice() public view returns(int){
        return price;
    }

    function setBytesArrat() public{
        b1='a';
        b2='ab';
        b3='z';
        // b3[0]='c'; is error since byte array can't be modified using indexing.
    }
    */
    uint[] Numbers;

    function getDynamicArrayLength() public view returns(uint){
        return Numbers.length;
    }

    function addElement(uint item) public{
        Numbers.push(item);
    }

    function getElement(uint i) public view returns(uint){
        if(i < getDynamicArrayLength()){
            return Numbers[i];
        }
        return 0;
    }

    function f() public{
        uint[] memory y = new uint[](3);
        y[0]=1;
        y[1]=2;
        y[2]=3;
        Numbers = y;
    }
}