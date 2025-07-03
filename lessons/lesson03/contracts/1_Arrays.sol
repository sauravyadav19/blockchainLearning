// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.28;

contract LearnArrays{

    //lets say we want to store the name of the person who has funded to our project
    //we will do something like this
    //string internal name = "Ram";
    //but as most of the time there are multiple persons funding a project, and it is safe to say
    // we should not store every name in its own variable, this would make the code unreasonably more complex and hard to follow or read.
    // to sovle this we have arrays. a data strcutre that help us to store mutliple values with a single name and indexed 
    // In solidity the array has to be homogenous(of same kind) as its a static language meaning we have to specifiy what kind of values we are
    //going to store in a variable before compilation.

    //---Syntax of declaring a Array---
    // <Data-Type(what kind of value it will store)> [] <visibility-specifer (defaults to internal)> <name-of-the Array>;
    // <Data-Type(what kind of value it will store)> [] <visibility-specifer (defaults to internal)> <name-of-the Array> = [(values spaced by comma if we want the array to start with some values)];
    // by default if you do not intialize the array with any inital values it gets initialized by the default values of the Array's Data type.
    //Example

    string[] public fundersNames = ['Jon', 'Dancerys','Arya'];
}