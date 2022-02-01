// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

//creating contract
contract ParentContract{

    //this function will give permission for override
    function foo() public pure virtual returns (string memory) {
        return "Parent Contract";
    }

    //this function will give permission for override
    function addition(uint _numFirst,uint _numSecond) public virtual pure returns(uint){
        return _numFirst+_numSecond;
    }

    function stringName(string memory name) public pure returns(string memory _name){
        _name=name;
    }
    
}

//contract inheritance
contract Child is ParentContract{

    //method override
    //this function will give permission for override
    function foo() public pure virtual override returns (string memory) {
        return "Child";
    }
    
    //method override
    function addition(uint _numFirst,uint _numSecond) public override pure returns(uint){
        return _numFirst+_numSecond+10;
    }
} 

//contract inheritance
contract Final is Child{
    //method override
    function foo() public pure  override returns (string memory) {
        return "Final";
    }
    
}
