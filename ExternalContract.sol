pragma solidity 0.5.12;

// Interface = definition of a contract and its functions definitions
// we don't need the entire function, just the header (definition)
contract PayableContracts{
    function v2() public payable;
}

contract ExternalContract{
    
    //Create an instance of an external contract
    PayableContracts instance = PayableContracts(0xF3D9d6aD495EAfe5Db887AbE3b91E52fD6c19313);
    
    function externalPayableContracts() payable public{
        instance.v2.value(msg.value);
        //Obs: if this function had parameters:
        //instance.v2.value(msg.value)([function params]);
    }
    
    
}