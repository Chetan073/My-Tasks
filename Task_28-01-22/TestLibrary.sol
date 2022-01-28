// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;
//importing library
import "./MyLibrary.sol";
import {MyFirstLibary} from "./LibraryExample.sol";

contract TestLibrary{
    //using library properties for uint datatype
   
    using MyLibrary for uint;

    function testIncrement(uint _num)public pure returns(uint){
        //function call which define in MyLibrary
        return MyLibrary.increment(_num);
    }

    function testDecrement(uint _num)public pure returns(uint){
        //function call which define in MyLibrary
        return _num.decrement();
    }

    function testIncrementByValue(uint _num,uint _value)public pure returns(uint){
        //function call which define in MyLibrary
        return _num.incremenrByValue(_value);
    }

    function testDecrementByValue(uint _num,uint _value)public pure returns(uint){
        //function call which define in MyLibrary
        return _num.decremenrByValue(_value);
    }

    function display(uint _number) public pure returns(uint){
        return MyFirstLibary.addition(_number);
    }
}
