pragma solidity 0.5.12;

contract MySecondContract{
    
    struct Person{
        uint id;
        string name;
        //address walletAddress;
    }
    
    Person[] public people;
    
    function createPerson(string memory name) public {
        people.push(Person(people.length, name));
    }

}