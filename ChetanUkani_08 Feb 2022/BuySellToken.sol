// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

contract BuySellToken{

    mapping (address=>uint) balances;

     //mapping a address with another mapping that
    //map address with token
    mapping(address=>mapping(address=>uint256)) allowances;

    uint immutable _tokenPrice;
    uint constant _etherPrice=10**18;
    uint internal _totalSupply;
    address public ownerAddress;
    string internal _name;
    string internal _symbol;
    uint8 internal _decimal;

    mapping (address=>uint) EtherValue;
    constructor(uint tokenPrice){
        ownerAddress=msg.sender;
        _name="MyToken";
        _symbol="UCG";
        _decimal=0;
        _tokenPrice=tokenPrice;

    }

    //for traction creation event
    event Transaction(address account, uint amount,string message );

    //event for transfer amount from one address to another
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    //event must trigger on any successful call to approve(address _spender, uint256 _value).
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    //function for to buy a token
    function buyToken() payable external {
        require(msg.value>0,"you can not buy with 0 value");
        _totalSupply=msg.value/_tokenPrice;
        balances[msg.sender]+=_totalSupply;
        emit Transaction(msg.sender,balances[msg.sender],"Token Bought");
    }

    //function to display balance of given address
    function balanceOf(address _owner) external view returns (uint){
        return balances[_owner];
    }

    //function for to sell a token to recipient
    function sellTokenByAdmin(address _to,uint noOfToken) external {        
        require(_to!=address(0),"You can not use default address");
        require(balances[ownerAddress]>=noOfToken,"Insufficient token");       
        balances[ownerAddress]-=noOfToken;
        balances[_to]+=noOfToken;
        EtherValue[ownerAddress]+=(noOfToken*_tokenPrice)/_etherPrice;
        emit Transaction(_to,noOfToken,"Token SoledByAdmin");
    }

    
    //function for to display owners's Ether value
    function OwnerWallet() external view returns(uint) {
        require(msg.sender==ownerAddress,"You are not Owner");
        return (EtherValue[ownerAddress])/_etherPrice;
        
    }
    //return name of my token
    function name()  external view   returns (string memory){
        return _name;
    }

    //will return symbol of my token
    function symbol()  external view  returns (string memory){
        return _symbol;
    }
    //will return decimal 
    function decimals() external view returns (uint8){
        return _decimal;
    }

    function totalSupply() external view returns(uint){
        return _totalSupply;
    }

     //transfer amount from sender to recipient
    function transfer(address _to, uint256 _value) public returns (bool success){
        
        return transferFrom(msg.sender,_to,_value);
    }

    //transfer value from given address to recipient 
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(_from !=address(0),"Address should not default");
        require(balances[_from]>=_value,"sending value should less than or equal of balanace");
        balances[_from]-=_value;
        balances[_to]+=_value;
        emit Transfer(_from,_to,_value);
        return true;
    }

    //function give permission to psender address
    function approve(address _spender, uint256 _value) public returns (bool success){
        require(_spender !=address(0),"Address should not default");
        require( balances[msg.sender]>=_value,"sending value should less than or equal of balanace");
        allowances[_spender][msg.sender]=_value;
        emit Approval(msg.sender,_spender,_value);
        return true;
    }

    //function for returns the amount which _spender is still allowed to withdraw from _owner.
    function allowance(address _owner, address _spender) public view returns (uint256 remaining){
        remaining= allowances[_spender][_owner];
    }

    //function for increase total supply of token
    function _mint(uint mintToken) external {
        require(msg.sender==ownerAddress,"You are not admin");        
        _totalSupply=_totalSupply+ mintToken;
        balances[ownerAddress]+=(mintToken)/_etherPrice;
        emit Transfer(address(0),ownerAddress,mintToken);

    }
    //function for burn token from total supply
    function _burn(uint burnToken) external{
        require(balances[ownerAddress]>=burnToken,"burn amount exceeds balance");
        balances[ownerAddress]-=burnToken;
        _totalSupply-=burnToken;
        emit Transfer(ownerAddress,address(0),burnToken);
    }
}
