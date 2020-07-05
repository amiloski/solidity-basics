pragma solidity 0.5.12;

contract TransferFunds{
    
    constructor() public{
        owner = msg.sender;
    }
    
    address public owner;
    uint public balance;
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    modifier costs(uint cost){
        require(msg.value == cost);
        _;
    }
    
    function receiveFunds() public payable costs(1 ether) {
        balance += 1 ether;
    }
    
    // Let the owner withdraw the money from the contract
    function withdrawAll() public onlyOwner{
        
        // BAD SOLUTION
        // msg.sender.transfer(balance); // transfer functions exists within every payable address
        // balance = 0; // this is bad!!! since every state change should happen BEFORE any outside communication
        
        // GOOD SOLUTION
        uint toSend = balance;
        balance = 0;
        msg.sender.transfer(toSend); // this will revert if transfer() fails for some reason, which is why it is ok to set balance = 0 before this line (if it reverts for some reason, the entire transaction will also revert)
        
        // Solution with send()
        /*
        The difference between send() and transfer() is that the first will return false if it fails, while transfer() will revert
        It might be useful if you need some custom error handling
        */
        //if (msg.sender.send(toSend)) == true{} 
    }
    
    /*
    Address vs payable address types
    address addr;
    address payable addr;
    
    Only payable addresses have the .send() and .transfer() functions
    
    It is easy to cast a payable address to a non-payable one:
    address creator = msg.sender;
    
    However, the opposite is not that straight forward:
    address payable test = address(uint160(creator));
    */
    
    
}