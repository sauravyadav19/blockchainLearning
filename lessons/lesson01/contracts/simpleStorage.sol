// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol"; // This is there to add the console.log feature (specific to hardhat)
contract simpleStorage{
    //variable are static 
    //variable decalaration looks like this:
    // <DataType> <visiblity-specifier> <name-of-Variable>;
    address public owner;
    constructor(){ 
         owner = msg.sender;
         console.log(owner);
    }
    uint public favoriteNumber; 

    function setFavNumber (uint _newFavNumber) public{
        favoriteNumber = _newFavNumber;
    }

    // function are defined in this way

    /* <function(keyword)> <name-of-function> <visibility-specifier> <State-Mutability-Specifiers[view,pure,payable]> <returns(keyword)> <(returnType with the brackets)> {
            //body
    } */
    
    function  getFavNumber() public view returns(uint){
        return favoriteNumber;
    }
}