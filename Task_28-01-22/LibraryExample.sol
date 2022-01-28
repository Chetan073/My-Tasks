// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

//creating libraray
library MyFirstLibary{
    function addition(uint number) pure internal returns(uint){
        return number+56;
    }
}

//use libraray internally
contract LibraryExample{
    function fun() external pure returns(uint){
        uint result=MyFirstLibary.addition(35);
        return result;
    }
}
