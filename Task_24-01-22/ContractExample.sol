pragma solidity >=0.4.16 <0.9.0;
//creating contract
contract ContractExample {

    //state variable
    uint storedData;
    //function for sore the data
    function set(uint x) public {
        storedData = x;
    }
    //return the value what we have stored
    function get() public view returns (uint) {
        return storedData;
    }
}

