//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract CryptosToken{
    string constant public name = "Cryptos";
    uint supply;
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function setSupply(uint _supply) public{
        supply = _supply;
    }

    function getSupply() view public returns(uint){
        return supply;
    }
}

contract MyTokens{
    string[] public tokens = ['BTC', 'ETH'];
    
    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = 'VET';
    }
    
}

contract Deposit{
    address admin;
    constructor(){
        admin = msg.sender;
    }
    receive() external payable{}

    function getBalance() view public returns(uint){
        return address(this).balance;
    }

    function transferBalance(address payable recepient, uint amount) public returns(bool){
        require(admin == msg.sender,"Transfer Fails, You are not the owner!!");

        if(amount <= getBalance()){
            recepient.transfer(amount);
            return true;
        }
        return false;
    }
}

contract Game{
    address[] public players;

    function start() public{
        players.push(msg.sender);
    }
}

contract A{
    int public x = 10;
 
    function f3() internal view returns(int){
        return x;
    }

    string public s1 = 'aaa';
    string public s2 = 'bbb';
    string public s3;

    function concatenate1() public view returns(string memory){
        string memory s;
        s = string(abi.encodePacked(s1,s2));
        return s;
    }

    function concatenate2() public{
        s3 = string(abi.encodePacked(s1,s2));
    }
}

contract B is A{
    int public xx = f3();
}