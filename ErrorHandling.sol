pragma solidity 0.5.12;

contract ErrorHandling{
    
    /*
    - Require
    require() function checks for:
        valid conditions
        inputs
        
    if exception
        throw anerror, revert transaction
        
    ex that requires the caller of the function to be the owner of the contract:
        require(msg.sende == owner)
        
    
    - Asset 
    assert() test for internal errors & invariants* -- consumes all of the remaining gas 
    should only throw an error if there is an internal error in our contract
    ex: a contract that should transfer funds from A to B and then assert the balance at the end of the execution
    
    *Obs: invariant = a condition that is always true at a given point
    */
    
    struct Person{
        string name;
        address walletAddress;
        uint age;
        bool senior;
    }
    
    mapping(address => Person) private people;
    
    // A very commom design pattern in smart contracts
    address[] private creators;
    
    // Only the owner can access the creator list
    function getCreator(uint idx) public view returns (address){
        require(msg.sender == owner);
        return creators[idx];
    }
    
    function createPerson(string memory name, uint age) public {
        require(age > 0 && age < 150, "That is propably not true my man, sorry!");
        Person memory p;
        p.age = age;
        p.name = name;
        if (age > 65){
            p.senior = true;
        }
        else{
            p.senior = false;
        }
        insertPerson(p);
        // There is no native way to compare two structs, therefore we need to apply a hashing function
        assert (
            keccak256(abi.encodePacked(people[msg.sender].name, people[msg.sender].age, people[msg.sender].senior)) == 
            keccak256(abi.encodePacked(p.name, p.age, p.senior))
            );
    }
    
    function insertPerson(Person memory p) private{
        address creator  = msg.sender;
        people[creator] = p;
        creators.push(msg.sender);
    }
    
    function getPerson() public view returns (string memory name, uint age, bool senior){
        return (people[msg.sender].name, people[msg.sender].age, people[msg.sender].senior);
    }
    
    address public owner;
    
    // Runs whenever (and only when) a contract is created; need to be public
    constructor() public{
        owner = msg.sender;
    }
    
    // Execution is restricted to the address that deployed the contract
    function deletePerson(address creator) public{
        require(msg.sender == owner);
        delete people[creator];
        assert(people[creator].age == 0);
    }
    
}