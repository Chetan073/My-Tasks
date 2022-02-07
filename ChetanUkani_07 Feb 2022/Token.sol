pragma solidity 0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20{

    //constructor for taking initial supply from user
    constructor(uint initialSupply) ERC20("Token","MYETH"){
        _mint(msg.sender,initialSupply);
    }
    //method override
    function decimals() public view override returns (uint8) {
        return 0;
    }
}
