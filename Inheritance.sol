pragma solidity 0.5.12;

/*
Solidity supports inheritance between smart contracts
Solidity compiler copies the base contract bytecode into derived contract bytecode
The is keyword is used to inherit the base contract in the derived contract.
Solidity supports multiple inheritance: contract A is B,C,D{}
It should be noted that using inheritance in Solidity, there is eventually just one contract that is deployed instead of multiple contracts. 
There is just one address that can be used by any contract with a parent-child hierarchy.

reference: https://medium.com/coinmonks/solidity-and-object-oriented-programming-oop-191f8deb8316
*/

import "./Ownable.sol";
import "./Destroyable.sol";

contract myContract is Ownable, Destroyable{
    
    
    
}