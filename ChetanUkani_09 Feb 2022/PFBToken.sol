pragma solidity 0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//creating my own token
contract PFBToken is ERC20{
    
    mapping(address=>uint) balance; //mapping for to store balance with address 
    mapping(address=>bool) whiteAddressMap; //mapping address with bool value for whitelist address
    mapping (address=>uint) EtherValue; //to store ether value in this variable
 

    address public ownerAddress; //store owner's address.
    address public newOwnerAddress; //store new owner's address.

    uint256 immutable _tokenPrice;  
    uint256 internal _totalSupply;
    
   
    
    constructor(uint tokenPrice) ERC20("MyToken","UCG"){
        //function call
        ownerAddress=msg.sender;
        _tokenPrice=tokenPrice;
        _totalSupply=0;       
    }

    //for traction creation event
    event Transaction(address account, uint amount,string message );

    //preSale event
    event preSalePostEvent(address owner,address buyer,string message);

    //modifier for to check condition if it is admin or not
    modifier checkForAdmin{
        require(msg.sender==ownerAddress,"You are not admin");
        _;
    }

    //modifier for to check condition if given adderess is in whitelist or not
    modifier checkForWhitelist(address buyer){
        require(whiteAddressMap[buyer]==true,"Address id not available in whitelist");
        _;
    }

    //function override for return zero.
    function decimals() public view override returns (uint8) {
        return 0;
    }

    //function for to display total supply of token
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    //function for to display balance of given address
    function balanceOf(address account) public view override returns (uint256) {
        return balance[account];
    }

    //function for to display available ether of owner address
    function etherBalance() external checkForAdmin returns(uint){
        return (EtherValue[ownerAddress])/10**15;
    }

    //function for to initial supply of token
    function supplyByOwner()external payable checkForAdmin{        
        require(msg.value>0,"You can not supply with zero value");
        _totalSupply=msg.value/_tokenPrice;
        balance[msg.sender]+=_totalSupply;
        emit Transaction(ownerAddress,balance[msg.sender],"Token supplied");
    }

    //function gor to maaping address as whitelist address using bool value
    function whiteListedAddress(address addressFirst) external checkForAdmin{

        whiteAddressMap[addressFirst]=true;
        //whiteAddressMap[addressSecond]=true;
    }

    //function for to buy a token by given address but given address should be in whitelist
    function preSale(address buyerAddress) external payable checkForWhitelist(buyerAddress) {
        //require(whiteAddressMap[buyerAddress]==true,"This address is not availabe in Whilelisted Address");
        require(msg.sender==buyerAddress,"You can not buy token by using other account");
        require(msg.value>0,"You can not buy token with zero value");
        uint noOfToken=msg.value/_tokenPrice;
        require(balance[ownerAddress]>=noOfToken,"Owner has no enough token");
        balance[buyerAddress]+=msg.value/_tokenPrice;
        balance[ownerAddress]-=noOfToken;
        EtherValue[ownerAddress]+=msg.value;
        emit preSalePostEvent(ownerAddress,buyerAddress,"Token bought by whitelisted user");
        
    }

    //any one can but a token from owner
    function Sale(address buyerAddress)external payable{
        require(msg.sender==buyerAddress,"You can not buy token by using other account");
        require(msg.value>0,"You can not buy with zero value");
        balance[buyerAddress]+=msg.value/_tokenPrice;
        balance[ownerAddress]-=msg.value/_tokenPrice;
        EtherValue[ownerAddress]+=msg.value;
        emit preSalePostEvent(ownerAddress,buyerAddress,"Token bought by any user");
        
    }

    //function for to transfer a token from owner to in one of the whitelisted address
    function postSale(address _to) external checkForAdmin checkForWhitelist(_to){
        //require(whiteAddressMap[_to]==true,"This address is not available in whitelisted Address");
        uint balanceOfOwner=balance[ownerAddress];
        balance[_to]+=balanceOfOwner;
        balance[ownerAddress]=0;
        emit preSalePostEvent(ownerAddress,_to, "All remianing Token Transfered by admin to whitelisted user");

    }

    //function for increase total supply of token
    function _mint(uint mintToken) external checkForAdmin {           
        _totalSupply=_totalSupply+ mintToken;
        balance[ownerAddress]+=mintToken;
        emit Transfer(address(0),ownerAddress,mintToken);

    }
    //function for burn token from total supply
    function _burn(uint burnToken) external checkForAdmin{
        require(balance[ownerAddress]>=burnToken,"burn amount exceeds balance");
        balance[ownerAddress]-=burnToken;
        _totalSupply-=burnToken;
        emit Transfer(ownerAddress,address(0),burnToken);
    }

    //function for transfer ownership
    function transferOwnership(address _to)external checkForAdmin{
        newOwnerAddress=_to;
    }

    //function for accept ownership for new owner
    function acceptOwnership() external{
        require(msg.sender==newOwnerAddress,"Ownership is not transfered");
        ownerAddress=newOwnerAddress;
        newOwnerAddress=address(0);
    }



    
}
