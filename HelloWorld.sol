pragma solidity ^0.5.12; // tells the compiler which version of the compiler to use 

contract HelloWorld {
    // State/persistent variables 
    // when public, automatic getter provided 
    string public message = "Hello World!";
    
    // Interesting Data Types
    // uint >> unsigned int
    // address >> an Ethereum address ex: 0xF2374A7761e2733DB9e9E4f243f3B75C3642eF40
    
    // Data Structures
    uint[] public numbers = [1,2,3]; // index starts with 0; dynamic with []
   
    //View functions don't modify the state of the contract (they are also cheaper to run)
    function getMessage() public view returns(string memory){
        return message;
    }
    
    function setMessage(string memory newMsg) public {
        message = newMsg;
    }
    
    function getNumber(uint idx) public view returns(uint){
        return numbers[idx];
    }
    
    function addNumber(uint num) public{
        numbers.push(num);
    }
    
}


