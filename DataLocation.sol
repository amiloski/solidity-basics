pragma solidity 0.5.12;

contract DataLocation{
 
    /*
    Data Location = where we tell solidity to save the Data
    
    there are 3 options:
    - storage > saved permanently on the Ethereum Blockchain (or until the smart contract is destroyed). State variables are always in storage! Most expensive since we are storing on the blockchain
    - memory  > saved only during a function execution. ex: func param. with saved as 'memory' will be lost after the end of the execution 
    - stack   > hold local value-type variables (uint, bools, etc); also gets deleted after the function gets executed
    
    Obs: function params default to 'memory'. Exceptions are more complex types such as String, Struct. In this case, we need to specify
    
    */

    mapping(uint => User) users;

    struct User{
        uint id;
        uint balance;
    }

    function addUser(uint id, uint balance) public {
        users[id] = User(id, balance);
    }

    // This function is a good example where using 'storage' is required!
    // if 'memory', balance would neved be updated!
    function updateBalance(uint id, uint balance) public {
         User storage user = users[id];
         user.balance = balance;
         
         //another solution would be to directly modify the mapping:
         //user[id].balance = balance
    }

    function getBalance(uint id) view public returns (uint) {
        return users[id].balance;
    }

}