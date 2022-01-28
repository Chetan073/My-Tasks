// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

//creating interface
interface FirstInterface{
    function setIntValue(uint numFirst,uint numSecond) external;
}

//creating anothe interface
interface SecondInterface{
    function setStringValue(string memory nameFirst,string memory nameSecond) external;
}

//contract for to implement interface
contract MultipleInterfaceExample is FirstInterface,SecondInterface{
    //state variable
    uint private _numFirst;
    uint private _numSecond;
    string private _nameFirst;
    string private _nameSecond;

    //function for set int value in state variable
    function setIntValue(uint numFirst,uint numSecond) external override{
        _numFirst=numFirst;
        _numSecond=numSecond;
    }

    //function for set string value in state variable
    function setStringValue(string memory nameFirst,string memory nameSecond) external override{
        
        _nameFirst=nameFirst;
        _nameSecond=nameSecond;
    }

    //function for to det the int data
    function getIntData() external view returns(uint,uint){
        return (_numFirst,_numSecond);
    }

//function for to get string data
    function getStringData() external view returns(string memory,string memory){
        return (_nameFirst,_nameSecond);
    }
}

