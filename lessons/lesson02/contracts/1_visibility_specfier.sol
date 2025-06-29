// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.28;

contract ParentHouse{

    string private vault = "Money";
    //private variables are only accessible to the contract they are decalred it and its fucntions
    // Does not get inherit nor is accessible by other contract 
    // when we are marking a variable private that DOES NOT mean it cannot be seen by other people, you 
    // entire code is stored on a blockchain and for anyone to see and read, marking them private only 
    //means that they are programatically non-accesible to other contracts that it they are not hiding what
    //stored in them.
    
    string private privateSpace = "Bedroom";
    string internal sharedSpace = "Living room, Lounge, Kitchen";
    //Resources marked as internal are accesible within the contract it is created and the contracts
    //that will inherit from the contract internal variable are created in.
    //Not accesible by other contracts.
    // by default all variable are marked as internal if you do not specify the visiblity of that variable/function

    string public doorbell = "Doorbell";
    //Resources marked as publi are accesible within the contrat they are created, the contrat that will inherit from the
    //contract public resouce is created in as well as anyone other contract can also call it.
    //compiler generates automatically generates a getter functions for variables marked as public.

    function usePrivateSpace() private view returns(string memory){
        return privateSpace;
    }

    function useSharedSpace () internal view returns(string memory){
        return sharedSpace;
    }

    function showVaultContent() public view returns(string memory){
        return vault;
    }
    function ringDoorbell() external view returns(string memory){
        return doorbell;
    }
    // Functions marked as external behave similarly to public but with key differences
    // that ONLY Functions can be marked external and not variables and
    // that functions marked as external will not be accessible within the contract they
    // are decleared or defined into.
    // then why do we want to use external ever? 
    // there is a very good reason and it has to do with gas optimization but before that you need to know about
    // how solidity handles data behind the scene

    /*
    there are two locations,memory and calldata, whenever a functions gets called by external user
    under the hood the data arguments passed by that external user's call of the functions are stored
    in a cheap read-only place, that place is call calldata, ones the values are read and are of no more 
    of use calldata is discarded, keeping it gas efficient; where as when the data is to be held for the 
    duration of the execution of the function, it is stored in memory, as this complex and requires allocation and deallocation
    of the space, storing in it would be expensive (higher gas fee),think of calldata as CPU registers and Memory as RAM.


    Now back to external and public, so when we mark a resource(functions) as external, we are telling compiler this resource(function)
    is only meant to be called from the outside of the contract and hence you can store the data arugmnet that comes
    with the call of that resource(fucntion) in calldata, i assure you that the data will not be needed within the contract
    and so you can store in that tempoary location call calldata.
    but when we are marking a resouce(function) with public visibility specifer we are being ambiguous in the sense of where 
    this function can be called from,compiler assumes the complex and the worst case which is that it might be called from
    within the contract and hence it is required to keep that temporary location's data into more "permanent" data location
    and hence copies it to the memory and as copying of the data requires space which is expensive and hence increasing the gas fee
    and making it costly, this may seems like a small thing at first but if you imagine that function being called multiple times 
    that cumulates to a large overhead cost.

    so it is alway the best practice to mark the resouce(functions) external which you think are requied only for the tempoary
    purpose and can then be discared and public if they are needed within the contract later and requires a more "permanent"
    storage. but that said it does not mean calldata is all bad, it gives you security, gas efficency and immutalbility.
    */

}

contract ChildHouse is ParentHouse{
    string private childPrivateSpace = "Child's Bedroom";
    // Child Contract's own private variable, can only be access by it and it's functions

    function useChildSharedSpace() public view returns(string memory){
        return sharedSpace;
        // we could have also called the Parent's useSharedSpace() internal function here instead of directly
        // accessing the Parent's sharedSpace variable (all resouces(variables/functions) marked by the internal
        // are accessible by the inheriting class.
    }
}
/*
|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| Specifier | Where is it Accessible?           | Auto Getter for State Vars? | Default Data Location for Arguments | Gas Efficiency (External Calls) |
|-----------|-----------------------------------|-----------------------------|-------------------------------------|---------------------------------|
| public    | Anywhere (Internal + External)    | Yes                         | memory (copied from calldata)       | Good                            |
| external  | External Calls Only               | N/A (for functions)         | calldata                            | Best                            |
| internal  | This Contract + Derived Contracts | No                          | memory                              | N/A                             |
| private   | This Contract Only                | No                          | memory                              | N/A                             |
|-----------------------------------------------------------------------------------------------------------------------------------------------------|
*/
