// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

contract Modifier{

    //creating modifier
    modifier sameCode(){
        //common code is putted in modifier

        for(uint _i=0;_i<10;_i++){
            //code
        }
        //it suggest to move original function that you are excecute
        //simple terms, you are added in function signature
        _;
        //code
    }
    function funFirst() public sameCode pure returns(string memory){
        
        return "funFirst say hi..";
    }
    function funSecond() public sameCode pure returns(uint _num) {
        
        //return 20;
        _num=20;
    }
    function funThird() public sameCode view returns(address){
        
        //this return globle varibale so i need to set a view function
        return msg.sender;
    }
}
