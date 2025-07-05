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
        //CODE OPTIMIZATION:
        //refer to setFunder() for a gas saving tip.
    }

    // function to push values in the our array of funders
    function setFunders(string calldata _name, uint _amount) public{

        // funderDetail memory newFunder;
        // newFunder.name = _name;
        // newFunder.amount = _amount;
        // funders.push(newFunder);
        //CODE OPTIMIZATION:
        funders.push(funderDetail({name:_name,amount:_amount}));
        //Directly push them to the array instead the way the above commented code of using intermediatory variable
        // save a little gas and easier to read
        // same thing can be done with code of the constructor, but leaving it like that for future reference
    }
    //create a getter for funders
    // CODE OPTIMIZATION:

    // function getFunders() external view returns(funderDetail[] memory){
    //     return funders;
    // }

    //This might look like a function that has no problem, but under the hood its a ticking bomb
    //the way this function is written it tries to return entire array all at once copying from the 
    //storage, this is fine for an array which is small in size but when the funders array grows to 
    // say even as small numbers as 2000, the cost would be astronomical gas, as it will send the EVM
    // into a massive loop, and as the resouce are limited (the set gas allocated for one block), it would
    // easily be exhausted because of this massive loop thus simply viewing your array would costly operation.

    //SOLUTION:

    // you can simply copy the funders one by one instead of asking for the entire array
    // ANALOGY: say you work at a public library and if your boss ask to give you get him photocopy of all
    // the books in the library at once, it would be chaotic to say the least, but if you bring one book at 
    // a time on your desk, its easier to maintain and work with.

    // Use index to reterive one funder at a time, that way its gas effective




}