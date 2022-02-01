// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;


contract VirtualBank{
    
    //address for user's account
    address payable public owner;
    //mapping address with balanace
    mapping(address => uint) private balances;

    constructor() {
        owner=payable(msg.sender);
        //owner = payable(0x5dEf87Aa2205F25aBd99902aCdEB51A957540CC9);
    }

    //event Log(string func,address sender, uint value, bytes data);

    //define fallback function
    fallback () external payable {
        //emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    //define receive function
    receive() external payable{
        //emit Log("receive", msg.sender, msg.value,"");
    }

    /*function getBalance() external view returns(uint){
        return address(this).balance;
    } */
    function getBalance() external payable  {
        balances[owner]=address(this).balance;
        
    } 

    //check sufficeint balance available or not
    modifier Checker(uint value){
        require(balances[owner]>value,"Insufficient balance");
        _;
    } 

    //function for sent value to another account
    function sendAmount(address payable _to,uint amount) public payable Checker(amount) returns(uint){
        // Send returns a boolean value indicating success or failure.
        
        bool sent = _to.send(amount);

        require(sent, "Failed to send Ether");
        uint temp=address(this).balance-amount;
        balances[owner]=temp;
        return temp;
        
    }

    //function for withdrow amount
    function withdraw(uint _amount ) external Checker(_amount){

        require(msg.sender == owner, "caller is not owner");
        
        //payable(owner).transfer(_amount);
        owner.transfer(_amount);
    }



}
