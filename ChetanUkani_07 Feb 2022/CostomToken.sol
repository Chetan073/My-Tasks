interface ERC20Token {
    //function declaration for name of Token
    function name()  external view returns (string memory);

    //function declaration for symbol of Token
    function symbol()  external view returns (string memory);

    //function declaration for to show decimal of Token
    function decimals() external view returns (uint8);

    //function declaration for total supply of Token
    function totalSupply() external view returns (uint256);

    //function declaration for to see balance of given address
    function balanceOf(address _owner) external view returns (uint);

    //function declaration for transfer value from sender address to recipient
    function transfer(address _to, uint256 _value) external returns (bool success);

    //transfer a calue from given address to recipient address 
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);

    //function give permission to spender address 
    function approve(address _spender, uint256 _value) external returns (bool success);

    //function for to check remaining balance of spender
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);

    //event for transfer amount from one address to another
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    //event must trigger on any successful call to approve(address _spender, uint256 _value).
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
//contract for transfer owner ship
contract Owner{
    address public owner;
    address public newOwner;

    event OwnershipTransffered(address indexed _from, address indexed _to );
    constructor(){
        owner=msg.sender;
    }
    //function for trnasfer ownership
    function transerOwnership(address _to) public{
        require(msg.sender==owner);
        newOwner=_to;
    }

    //function for accept newowner
    function acceptOwnership() public{
        require(msg.sender==newOwner);
        emit OwnershipTransffered(owner,newOwner);
        owner=newOwner;
        newOwner=address(0);
    }
}
//contract for making my own token
contract CostomToken is ERC20Token, Owner{
    string internal _symbol;
    string internal _name;
    uint8 internal _decimal;
    uint internal _totalSupply;
    address internal _minter;

    mapping (address=>uint)balances;
     //mapping a address with another mapping that
    //map address with token
    mapping(address=>mapping(address=>uint256)) allowances;

    constructor(uint initialSupply){
        _symbol="CMK";
        _name="Token";
        _decimal=0;
        _totalSupply=initialSupply;
        _minter=msg.sender;
        //_minter=0x5dEf87Aa2205F25aBd99902aCdEB51A957540CC9;
        balances[_minter]=_totalSupply;
    } 
    //return name of my token
    function name()  external view override  returns (string memory){
        return _name;
    }

    //will return symbol of my token
    function symbol()  external view override returns (string memory){
        return _symbol;
    }
    //will return decimal 
    function decimals() external view override returns (uint8){
        return _decimal;
    }

    //will return total supply of token
    function totalSupply() external view override returns (uint){
        return _totalSupply;
    }
    //will return balance of given address
    function balanceOf(address _owner) external view override returns (uint){
        return balances[_owner];
    }

    //transfer amount from sender to recipient
    function transfer(address _to, uint256 _value) external override returns (bool success){
        require(balances[msg.sender]>=_value);
        balances[msg.sender]-=_value;
        balances[_to]+=_value;
        emit Transfer(msg.sender, _to,_value);
        return true;
    }
    //transfer value from given address to recipient 
    function transferFrom(address _from, address _to, uint256 _value) external override returns (bool success){
        require(balances[_from]>=_value);
        balances[_from]-=_value;
        balances[_to]+=_value;
        emit Transfer(_from,_to,_value);
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
        remaining= allowances[_spender][_owner];
    }
    /*
    //take 
    function mint(uint amount) public returns(bool){
        require(msg.sender==_minter);
        balances[_minter]+=amount;
        _totalSupply+=amount;
        return true;
    }*/
}
