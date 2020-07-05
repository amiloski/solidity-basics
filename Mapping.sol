pragma solidity 0.5.12;

contract Mapping{
    
    struct Person{
        string name;
        address walletAddress;
        uint age;
        bool senior;
    }
    
    //used for Key-value storage (similar to a Python dictionary)
    // Syntax: mapping(key dtype => value to be returned) public [name of the mapping]
    mapping(address => Person) private people;
    
     
    function createPerson(string memory name, uint age) public {
        // Return the address of the sender of the called of the function!
        address creator  = msg.sender;
        Person memory p;
        p.age = age;
        p.name = name;
        if (age > 65){
            p.senior = true;
        }
        else{
            p.senior = false;
        }
        
        // Add a person to the mapping
        people[creator] = p;
    }
    
    // build or own getter since the default one will ask for an address
    
    // Common, fix this, why can't I return a struct?!
    //function getPerson() public returns (Person memory){ 
        
    function getPerson() public view returns (string memory name, uint age, bool senior){
        return (people[msg.sender].name, people[msg.sender].age, people[msg.sender].senior);
    }
}