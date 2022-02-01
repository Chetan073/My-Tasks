// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

//creating contract
contract Message{
    
    //indeting will be create only for 3 variable
    event message(address  senderAddress, address receiver,string data);

    //function for send message
    function sendMessage(address to, string memory dataValue)public{
        emit message(msg.sender,to,dataValue);
    }
}

//creating contrcat
contract EventsExmaple{
    event Account( string message,address account,uint value);

    //function for set data
    function setData(uint _val) public  {
        emit Account("Chetan Ukani", msg.sender,_val);
    }
}

