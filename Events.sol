pragma solidity 0.5.12;

contract Events{
    
    /*
    Events are small notifications that we can send on our contract that gets included on the Blockchain (like a push notification)
    They are public (of course, they are on the Blockchain)
    This is a simple way to notify important things that are happening on the smart contract
    
    Ex. usecase: Dapp on a website that dependes on what happen in a contract. This website can leverage events to nofify the user about something important
    
    */
    
    struct Person{
        string name;
        uint age;
        bool senior;
    }
    
    // First, we need to define the structure of the event: event eventName([what data we need to send with the event])
    event personCreated(string name, bool senior);
    
    
    //Then, emit the event
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
        // you can check the info returned by the event on the log of the SC execution 
        emit personCreated(p.name, p.senior);
    }
}