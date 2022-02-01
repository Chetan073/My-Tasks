// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

//multiple inheritnace with mehod override

//creating contrat
contract First{
    uint public _numFirst;

    constructor(){
        _numFirst=10;
    }

    //funcrion override
    function fun() public pure  virtual returns(string memory){
        return "I am in First Contrcat";
    }

    function funFirst() public {
        _numFirst=_numFirst*2;
    }
}

//inheritance
contract Second is First{
    uint public _numSecond;

    constructor(){
        _numSecond=10;
        _numFirst=56;
    }

    function funSecond() public {
        _numSecond=_numSecond*3;
    }

    //function override
    //give permission for override
    function fun() public pure virtual override returns(string memory){
        return "I am in Second Contrcat";
    }
}

//iheritance
contract Third is First,Second{
    //function override
    function fun() public pure  override(First,Second) returns(string memory){
        return "I am in Third Contrcat";
    }
}
