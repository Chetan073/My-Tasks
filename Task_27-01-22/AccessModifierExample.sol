pragma solidity ^0.5.0;

//creating contract
contract AccessModifierExample{
    //state variable
    uint private NumberFirst;
    uint private NumberSecond;

    //function for to ser value form user
    function setValue(uint number1,uint number2) public {
        NumberFirst=number1;
        NumberSecond=number2;
    }

    //function for to print return the set value
    function getValue() private view returns(uint,uint){
        return (NumberFirst,NumberSecond);
    }

    //add two number and return
    function addition() internal view returns(uint){
        return (NumberFirst+NumberSecond);
    }

    //subtract number and return
    function subtraction() external view returns(uint){
        //return (addition()-NumberSecond);

        uint answer=addition()-NumberSecond;
        //uint answer=NumberFirst-NumberSecond;
        return answer;
    }
    
}
contract InternalExternalExample{
    
        AccessModifierExample object=new AccessModifierExample();
        //uint public AddResult=object.addition();
        
        uint public result=object.subtraction(); 
    
    
}
/*
contract Child is InternalExternal{
        InternalExternal object=new InternalExternal();
        uint public answer=object.addition();
    }*/
   
