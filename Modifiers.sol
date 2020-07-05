pragma solidity 0.5.12;

contract Modifiers{
    
    // Modifiers is a way to execute a small piece of code before a function calldata
    
    address public owner;
    
    modifier onlyOwner(){ 
        require(msg.sender == owner);
        _; // Every modifier need to end with this. It only means 'continue the execution, the modifier is done'
    }
    
    // modifier usage in functions
    // a function header can have multiple modifers
    function deletePerson(address creator) public onlyOwner{
        //do something
    }

}