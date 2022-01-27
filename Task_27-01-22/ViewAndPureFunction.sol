pragma solidity ^0.5.0;

//creating contract
contract ViewAndPureFunaction{
    uint value; //state variable

    uint NumberFirst=10;
    uint NumberSecond=15;

    //functon to print the value
    function getValue() external view returns(uint){
        return value;
    }

    //function for to set the value by user
    function setValue(uint _value)external{
        value=_value;
    }


    function getResult() public pure returns(uint product,uint sum){
        uint NumberFirst=15;
        uint NumberSecond=10;
        product=NumberFirst*NumberSecond;
        sum=NumberFirst+NumberSecond;
    }   
}
