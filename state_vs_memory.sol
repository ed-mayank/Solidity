// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract A{
    string[] public cities = ['Bangalore','Mumbai','Hyderabad'];

    function f_memory() view public{    // not modifying the state variable
        string[] memory s1 = cities;
        s1[0] = 'Pune';
    }

    function f_storage() public{
        string[] storage s1 = cities;
        s1[0] = 'Pune';
    }
}