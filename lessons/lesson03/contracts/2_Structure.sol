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

    //we CANNOT initialize the above array something like this
    // funderDetail [] public funders = [{name:"Jon", amount:10},{name:"Araya", amount:20}]
    //WHY? but before we can answer that it is important that we know that something like this would be acceptable
    // uint[] anArrayofFavNumbers = [1,2,3,4,5,6,7,8] OR bool [] an arrayofBooValues = [true,false,false]
    // this is becasue the compiler know what size of values these are and by that providing an fix or known
    // amount of gas requried
    // but when we are creating our own type using struct compiler see a variable type as in it does not have a fix size
    // there is string in funderDetail structure which could vary frome element to element of funderDetail type 
    // this variablilty prevents compiler to use one-fit-all type of work for each element to it by desing enforce
    // seperation of  the creation and initialization in differnt steps and hence allowing compiler to know the gas cost
    // in technical terms, you cannot create a state varaible of type with non-fixed size members and keep it dynamic and 
    // also initialize it all at the same time.
    // in terms of analogy, you are asking the builder(EVM) to build a bookself of whose capcity you do not know and hence
    // want it to extenable (dynamic), but also asking them at the same time to fit some certain books,
    //  this is not acceptable desing.
    /// in terms of a more technical analogy, you are asking database to create a table and also insert the value at 
    // the same time, basically doing this CREATE TABLE(Name char(10), Amount Integer) and ROWS (("Saurav",10), ("Dancerys",20))
    //  these two are different steps first you create the table then insert the values and not do it together


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