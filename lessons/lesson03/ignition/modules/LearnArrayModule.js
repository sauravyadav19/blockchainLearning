//This is where we write code to deploy our contract on the chain
// We are importing a function name "buildModule" from hardhat's ignitino library
//eariler the contract deployment was done in the "scripting way", we have to specify every steps
// like "Deploy Contact A" => then "get is address" and then => using that address "Deploy Contract B"
// this was teddious and more prone to errors and was complex.

//we introduction of the Hardhat ignnition was of working it all is easier now,
// instead of sepcfiying everything, you just tell hardhat, here is name of my contract
// figure out how to deploy, it finds the most reliable way and returns you the result
// its like you have a very skilled crew to whom you just give the blue print and ask them 
// to build the house and they figure out the nitty-gritty of things.

const {buildModule} = require("@nomicfoundation/hardhat-ignition/modules")
// Think of buildModule like writing a blueprint for your “construction crew”.
// You define what to build, not how.
// Hardhat Ignition handles the dependency resolution, ordering, and execution for you.


// here using are imported "buildModule" function we will create a module
// buildModule takes two parameters 
//1. Name of the Module (can be anything, its for your Identification)
//2. a Callback which is responsible for deploying our contract, it takes a parameter
//   "m" this is "module builder" which is how we get function like contract to deploy our contract

// m.contract(<name of the contract>) takes name of the contract as argument that you want to deploy on the chain
// the name of the contract should match extacly with name of the contract in your .sol file

module.exports = buildModule("LearnArrayModule", (m)=>{

    //returns an object with all the necessary details of your contract deployment
    //like address of the contract, whether is was sucessfull or not and so on.
    const deployedObject = m.contract("LearnArrays");
    return {deployedObject};
})