// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

interface  IERC20{
    //function declaration for name of Token
    function name() external view  returns (string memory);

    //function for Symbol of my token
    function symbol() external view  returns (string memory);

    //function for to return the number of decimals the token uses
    function decimals() external view  returns (uint8);

    //function for the total Supply of token
    function totalSupply() external view returns (uint256);

    //function for know the balance with given address
    function balanceOf(address _owner) external view  returns (uint256 balance);

    //function for transer amount to recipient 
    function transfer(address _to, uint256 _value) external  returns (bool success);

    //function fo allowing contracts to transfer tokens on your behalf.
    function transferFrom(address _from, address _to, uint256 _value) external  returns (bool success);

    //function for allows _spender to withdraw from your account multiple times, up to the _value amount.
    function approve(address _spender, uint256 _value) external returns (bool success);

    //function for returns the amount which _spender is still allowed to withdraw from _owner.
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);

    //event must trigger when tokens are transferred, including zero value transfers.
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    //event must trigger on any successful call to approve(address _spender, uint256 _value).
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}

//conrtact for creating mty own token

contract ERC20 is IERC20{
    //variable for store name of token
    string private _nameOfToken;
    //
    string private _sysmbolOfToken;
    uint8 private _decimalOfToken;
    uint private _totalSupply;
    
    
    mapping(address=> uint) balances;
    mapping(address=>mapping(address=>uint256)) allowances;

    constructor(){
        _sysmbolOfToken="UCG";
        _nameOfToken="My Token";
        _decimalOfToken= 0; 
        _totalSupply=0;      
        
        
    }
    //function for returing the of my token
    function name() external view override returns (string memory){
        return _nameOfToken;
    }
    //return symbol of my token
    function symbol() external view override returns (string memory){
        return _sysmbolOfToken;
    }

    //funtion for return decimal value 
    function decimals() external view override  returns (uint8){
        return _decimalOfToken;
    }

    //function for return total supply of my token
    function totalSupply() external view override returns (uint256){
        return _totalSupply;
    }

    //function for finding balance of given account
    function balanceOf(address _owner) external view override returns (uint256 balance){
        return balances[_owner];
    }

    //function for transeefring amount to given address
    function transfer(address _to, uint256 _value) external override returns (bool success){
        require(balances[msg.sender]>=_value);
        balances[msg.sender]-=_value;
        balances[_to]+=_value;
        emit Transfer(msg.sender,_to, _value);
        return true;
    }

    //function for transfering the amount from given address to recipient address
    function transferFrom(address _from, address _to, uint256 _value) external override returns (bool success){
        require(balances[_from]>=_value);
        balances[_from]-=_value;
        balances[_to]+=_value;
        emit Transfer(_from,_to, _value);
        return true;
    }

    //function give permission to psender address
    function approve(address _spender, uint256 _value) public override returns (bool success){
        require( balances[msg.sender]>=_value);
        allowances[_spender][msg.sender]=_value;
        emit Approval(msg.sender,_spender,_value);
        return true;
    }

    //function for returns the amount which _spender is still allowed to withdraw from _owner.
    function allowance(address _owner, address _spender) public override view returns (uint256 remaining){
        return allowances[_spender][_owner];
    }
    //function for give inital supply
    function _mint(address accountAddress, uint256 amount) internal {
        require(accountAddress != address(0)); 
        _totalSupply += amount;
        balances[accountAddress] += amount;
        emit Transfer(address(0), accountAddress, amount);

        
    }
}
//creating my contract  for my own token.
contract MyOwnToken is ERC20{

    constructor(uint256 initialSupply)  {
        //calling a method with given total supply
        _mint(msg.sender, initialSupply);
    }
}
