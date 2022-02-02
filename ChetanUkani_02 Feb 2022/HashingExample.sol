// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract HashingExample{
    bytes32 public name;

    //function for create hash and store in state varibale
    function fun(string memory _text) public  returns(bytes32){
        name=keccak256(abi.encodePacked(_text));
        return name;
    }

    //create hash for inputed text and check with state variable
    function magic(string memory _name) public view returns(bool){
        return keccak256(abi.encodePacked(_name))==name;
    }
}
