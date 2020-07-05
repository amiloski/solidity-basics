pragma solidity 0.5.12;

//It is very common to have a ownable contract to store the owner information because that is a pattern that is probably going to be repeated multiple times
contract Ownable {
    address payable public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
}