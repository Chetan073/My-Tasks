pragma solidity ^0.5.0;

contract StorageExample{

    //initializing aarray numbers
    int[] public numbers;

    /*function myNumbers() public  returns(int,int){
        numbers.push(1);
        numbers.push(2);

        int [] storage MyNewArray=numbers;

        MyNewArray[1]=5;

        return (numbers[0],numbers[1]);
    }*/

    function myNumbers() public returns(int,int){
        numbers.push(1);
        numbers.push(2);

        //coping storage location into memory
        int [] memory MyNewArray=numbers;

        MyNewArray[1]=5;

        return (numbers[0],numbers[1]);
    }
}
