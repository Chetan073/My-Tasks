pragma solidity ^0.5.0;

//external
/*
The External element can’t be inherited but it can be accessed by external elements. 
Current contract instance can’t access external element, it can be accessed externally only.
*/
contract MyContract {
  function someExternalFunction() external view returns (uint8) {
    return 10;
  }
}

contract AccessModifiers {
  function myFunc() public  returns (uint8) {
    MyContract object = new MyContract();
    object.someExternalFunction();


  }
}

//wrong....

/*contract OtherContract {
  function myFunc() external view returns (uint8) {
    // ...
  }

  function myOtherFunc() external view returns (uint8) {
    myFunc(); // Nope, doesn't work!
  }
}*/

//internal
/*
The Internal element can be inherited but can’t be accessed by external elements. 
Only the base contract and derived contract can access internal element.
*/
/*
contract MyContract {
  uint256 internal myVar;

  function myFunc() public view returns (uint256) {
    uint256 myVarCopy = myVar; 
  }
}

contract DerivedContract is MyContract {
  function myFunc() public view returns (uint256) {
    uint256 myVarCopy = myVar;
  }
}
*/

//wrong...
/*
contract OtherContract {
  function myFunc() public view returns (uint256) {
    MyContract object = new MyContract();
    // Nope this does not work. myVar is private to MyContract.
    object.myVar;
  }
}
*/

//private
/*
The Private element doesn’t get inherited and can't be accessed by external elements. 
It can be accessed from the current contract instance only. 
*/
/*
contract MyContract {
  uint256 private myVar;

  function myFunc() public view returns (uint256) {
    // This works, it's the same contract
    uint256 myVarCopy = myVar;
  }
}
*/

//wrong
/*
contract OtherContract {
  function myFunc() public view returns (uint256) {
    MyContract object = new MyContract();
    // Nope this does not work. myVar is private to MyContract.
    object.myVar;
  }
}
*/
