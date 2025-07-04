// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// say we want relevant/ related information about some entity, making seperate array for it and 
// then co-indexing them is tedious, error prone and lot of work so instead we use a differnt data 
//strcture called strcture; it combines multiple data types in one single unit

// example
// here we are storing both funder's name and their amount in one single unit

contract LearnStructures{

    struct funderDetail {
        string name;
        uint amount;
    }

    // creating an array of funders
    funderDetail [] public funders;

    constructor(){
        funderDetail memory funder;
        funder.name = "Jon";
        funder.amount = 10;
        funders.push(funder);
    }

    // function to push values in the our array of funders
    function setFunders(string calldata _name, uint _amount) public{

        funderDetail memory newFunder;
        newFunder.name = _name;
        newFunder.amount = _amount;
        funders.push(newFunder);

    }
    //create a getter for funders
    function getFunders() external view returns(funderDetail[] memory){

        return funders;

    }



}