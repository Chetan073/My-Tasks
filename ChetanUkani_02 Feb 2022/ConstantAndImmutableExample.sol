// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ConstantAndImmutableExample{
    
    uint constant ENROL_NO=180130116056;
    string constant NAME="Chetan";
    uint immutable maxBalance;
    address public immutable owner;

    constructor(uint _balance){
        maxBalance=_balance;
        owner=msg.sender;
    }
    /*
    function Check()external {
        ENROL_NO=180130116035;
        NAME="Jay";
    }*/

    function fun(uint number) view external returns(bool){
        return maxBalance>number;
    }
}
