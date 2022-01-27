pragma solidity ^0.5.0;

contract Example {
    //public state variable
    uint public data=56;
}


contract ObjectInContract{
    //making an object of other contrcat
    Example object=new Example();
    //functiom for to dispaly the vaue using object
    function display() public view returns(uint){

        //The compiler automatically creates getter functions
        //for all public state variables.
        return object.data();
    }
}
