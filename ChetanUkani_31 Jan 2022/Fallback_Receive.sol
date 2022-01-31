// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

//making contract
contract Fallback_Receive{

    //creating event
    event Log(string _fun,address _sender, uint _value, bytes _data);

    //fallback function
    fallback() external payable {
        emit Log("fallback",msg.sender,msg.value,msg.data);
    }

    //receive function
    receive () external payable{
        emit Log("receive",msg.sender,msg.value,"");
    }

    //check balance function
    function checkBalance() public view returns(uint){
        return address(this).balance;
    }
}
