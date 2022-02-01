// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

//contrcat first
contract First{
    //state variable
    uint public _numFirst;

    constructor(){
        _numFirst=10;
    }

    //function for multiply by 2 of state varibale 
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
    //function for multiply by 3 of state varibale
    function funSecond() public {
        _numSecond=_numSecond*3;
    }
}
//order wil be mention using base like to derive 
/*contract Third is Second,First{

}*/
//Right to left 
//depth first
contract Third is First,Second{

}
