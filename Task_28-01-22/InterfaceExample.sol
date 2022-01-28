// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

//creating interface
interface InterfaceExample{
    //function declartion
    function setValue(uint numOne,uint numTwo)  external;
    function addition()  external view  returns(uint);

}
//Derived contract is inherited InterfaceExample
contract Derived is InterfaceExample{

    //private variables
    uint private _numOne;
    uint private _numTwo;
    
    //function definition and override 
    function setValue(uint numOne,uint numTwo) external override{
        _numOne=numOne;
        _numTwo=numTwo;

    }
    //function definition and override 
    function addition() external view override returns(uint){
        return _numOne+_numTwo;
    }
}

//Contract for to make an object of Derived contract
contract Caller{

    //object of Derived contract
    InterfaceExample object= new Derived();

    

    //function for to call method by using object
    function getValue() public returns(uint){
        
        object.setValue(35,56);
        uint result=object.addition();
        //return object.addition();
        return result;
    }

}
