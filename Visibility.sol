pragma solidity 0.5.12;

contract Visibility{
    
    /* Function/Variable visibility options:
    external > only executable by other contracts
    internal > only from within the contract AND contract deriving from it {inheritance}
    private > only from within the contract itself
    public > everyone
    */
    
     struct Person{
        string name;
        address walletAddress;
        uint age;
        bool senior;
    }
    
    mapping(address => Person) private people;
    
    function createPerson(string memory name, uint age) public {
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
    }
    
    function insertPerson(Person memory p) private{
        address creator  = msg.sender;
        people[creator] = p;
    }
    
    function getPerson() public view returns (string memory name, uint age, bool senior){
        return (people[msg.sender].name, people[msg.sender].age, people[msg.sender].senior);
    }
}