// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

//creating contract
contract FallbackAndReceiveMethod{
    //creating event
    event Log(string func,address sender, uint value, bytes data);

    //define fallback function
    fallback () external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    //define receive function
    receive() external payable{
        emit Log("receive", msg.sender, msg.value,"");
    }


}
