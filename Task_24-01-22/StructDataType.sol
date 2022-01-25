pragma solidity >=0.4.16 <0.9.0;
// Creating a contract
contract StructDataType{

    // Defining a Structure
    struct student{
        string name;
        string subject;
        uint8 marks;
    }

    // Creating a structure object
    student public stdOne;

    //defining the function to return
    //values of the elements of the structure
    function structure() public  returns(
      string memory, string memory, uint){
        stdOne.name = "Chetan";
        stdOne.subject = "Maths";
        stdOne.marks = 92;
        return (
          stdOne.name, stdOne.subject, stdOne.marks);
    }
}
