// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract VirtualBank{

    mapping (address=> uint)balances;

    //for account creation event
    event forCreateAccount(address account, string message );

    //for traction creation event
    event forTransaction(address account, uint amount,string message );

    //event for transfer amount to another account
    event forTransfer(address _from, address _to, uint _amount, string message);

    //function for create account
    function createAccount() external{
        emit forCreateAccount(msg.sender,"Account is created");
    }

    //deposite amount in your created account
    function depositeAmount() payable external {
        balances[msg.sender]=balances[msg.sender]+msg.value;
        emit forTransaction(msg.sender, msg.value/10**18,"Amount is Deposited");

    }

    //modifier for check codition 
    modifier Checker(uint value){
        require(balances[msg.sender]>=value,"Insufficient Balance!");
        _;
    }

    //for transer to another account
    function toTransfer(address receiver,uint amount) external  Checker(amount) {
        uint valueInWei=amount*(10**18);
        balances[receiver]=balances[receiver]+valueInWei;
        balances[msg.sender]-=valueInWei;
        emit forTransfer(msg.sender,receiver,amount,"Successfull Tranfered");

    }

    //function for withdrow amount
    function withdrawAmount(uint amount) external Checker(amount){
        uint valueInWei=amount*(10**18);
        payable(msg.sender).transfer(amount);
        balances[msg.sender]-=valueInWei;
        emit forTransaction(msg.sender,amount,"Withdrow successfilly");
    }

    //function for check balance
    function getBalance() view external returns(uint, address){
        return (balances[msg.sender]/10**18,msg.sender);
    }

}
