pragma solidity ^0.5.0;
contract AssertStatement{
    bool result; //by defaut result will be false

    //function for to find sum of two int and check for given condition
    function checkOverflow(uint _numFirst, uint _numSecond) public{
        uint sum=_numFirst+_numSecond;
        assert(sum<=100); //if this statement is satisfie then next line will be executed
        result=true;
        
    }
    //check for result value
    function getResult() public view returns(string memory){
        if(result==true){
            return "No Overflow";
        }
        else{
            return "Overflow exist";
        }
   }
}
