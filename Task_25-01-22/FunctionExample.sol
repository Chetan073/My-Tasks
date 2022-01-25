pragma solidity ^0.5.0;

 //creating a contract
 contract FunctionExample{
     //defining a function to calcuate sum of 2 numbers
    /* function addition() public view returns(uint8){
         uint8 NumberFirst=10;
         uint8 NumberSecond=15;
         uint8 sum=NumberFirst+NumberSecond;
         return sum;
     } */

    //defining a function to calcuate sum of 2 numbers and its Square value
    function addition() public view returns(uint8){
        uint8 number1=5;
        uint8 number2=4;
        uint8 number=number1+number2;
        return square(number);
    } 

    //function for finding a square value
    function square(uint8 num) public view returns(uint8){
        num=num**2;
        return num;
    }
 }
