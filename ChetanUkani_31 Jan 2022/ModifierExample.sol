// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.5.0;

//creating contract
contract ModifierExample{
    address public owner=msg.sender;

    //creating modifier
    modifier onlyOwner(){
        //require statement 
        require(owner==msg.sender,"you are not the owner");
        _;
    }

    //function for start Auction
    function addition(uint _numFirst,uint _numSecond) public view onlyOwner returns(uint){
        uint numFirst=_numFirst;
        uint numSecond=_numSecond;
        return numFirst+numSecond;
        //code
    }

    //function for stop Auction
    function subtraction(uint _numFirst,uint _numSecond) public view onlyOwner returns(uint){
        uint numFirst=_numFirst;
        uint numSecond=_numSecond;
        assert(numSecond<=numFirst);
        return numFirst-numSecond;
        //code
    }

    

    //declare public state variable
    uint public age=22;
    //creating another modifier
    modifier temp(uint _num){
        
        require(age==_num,"Your Age is not same;");
        _;
    }

    //functio
    function changeAge(uint _ageInputed) public view temp(_ageInputed) returns(string memory){
        return "yeah...Your Age is same";
    }
}

    
