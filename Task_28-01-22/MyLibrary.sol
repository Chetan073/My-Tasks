// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;
library MyLibrary{
    //function for to increment by 1
    function increment(uint number) external pure returns(uint){
        return number+1;
    }

    //function for decement by 1
    function decrement(uint number) external pure returns(uint){
        return number-1;
    }

    //increment by value
    function incremenrByValue(uint number,uint value) internal pure returns(uint){
        return number+value;
    }

    //decement by value
    function decremenrByValue(uint number,uint value) internal pure returns(uint){
        assert(value<=number);
        return number-value;
    } 
}

