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
}