pragma solidity 0.5.12;

import "./Ownable.sol";

/*
You can’t update your code because each subsequent block on the blockchain contains the hash of the previous block(s) and changing this block to contain new code 
would mean we’d have to recalculate all the subsequent blocks in the blockchain and that’s not something that’s possible as this is exactly one of the things that the Ethereum blockchain prevents (changing history).

So … we can’t update our code. Good news though – we can remove it, and its data.


reference: https://articles.caster.io/blockchain/self-destructing-smart-contracts-in-ethereum/
*/

contract Destroyable is Ownable{
    
    //The selfdestruct operation (which is an OPCODE at the EVM level) sends all of the current smart contract balance to a destination address;
    // in this case to the owners address, which is stored in the owner variable.
    //At the same time, the contract’s data is cleared, freeing up space in the Ethereum blockchain and potentially lowering your gas price.
    //Important note: If you’re going self-destruct a contract AND you still need the data for whatever reason, you will need to query the data from the contract and store it somewhere (offline, into another contract, etc).
    //Self-destructing a smart contract is cheaper than simply performing a similar operation such as address.send(this.balance). It has been reported that this OPCODE uses negative gas because the operation frees up space on the blockchain by clearing the contracts data.
    // !!! Once the contract is self destructed, there’s no coming back. Game over. !!!
    // !!! If you send a transaction or funds to a self destructed contract your funds will be lost. !!!
    function destroyContract() public onlyOwner{
        selfdestruct(owner);
    }
    
    
}