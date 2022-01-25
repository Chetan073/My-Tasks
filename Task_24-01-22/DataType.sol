pragma solidity ^ 0.5.0;   
   
// Creating a contract
contract Types {  

    // define Bool variable
    bool public boolean;

    //define Integer variable
    int32 public int_var;

    //define String variable
    string public name;

    //define byte variable
    bytes1 public char;

    address public admin;


    constructor() public{
        boolean=true;
        int_var=-5680;
        name="Chetan";
        char="c";
        admin=msg.sender;
    }          
      
}
