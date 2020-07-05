pragma solidity 0.5.12;

contract PayableContracts{
    
    // Bear in mind that a Smart Contract can receive money the same way a simple wallet would.

    // Ex: charge user in order to execute something in the contract
    uint public balance;
    
    // Dynamic modifer that can handle multiple costs
    // the modifier will always be executed in the context of the function
    modifier costs(uint cost){
        require(msg.value == cost);
        _; // this is actually a pointer to the function whose header points to this modifier
    }
    
    // 'payable' tells solidity that this function is suposed to receive money
    function v1() public payable{
        // msg.value checks the value that is sent together with the transaction
        // the default price unit is 'wei', the smallest possible unit in Ethereum (similar to a satoshi in BTC), therefore we need to specify if we want our price unit to be 'ether'
        require (msg.value >= 1 ether);
        balance += msg.value;
    }
    
    // Using modifers
    function v2() public payable costs(1 ether){
        balance += msg.value;
    }
    
    
}