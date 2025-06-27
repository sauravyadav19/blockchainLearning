Fundamentals of the Hardhat
------------------------------------------------------------------------------------------------------
=>There is your Contract folder which is a conventional place to your Smart contracts
=> Your have ignition/modules this is where you the deployment script lives earlier it use to be file called "script" but now hardhat has replaced is with ignition/module
 => as a result the command to deploy is ```npx hardhat ignition deploy ignition/module/<name of your deployment file>```
 => there is a variant wherein you could specific the name of the network where you have a blockchain running at ```npx hardhat iginition deploy iginition/module/name-of-file --network localhost```
 => instead of writing a step-by-step script, you will create a "deployment module." Think of this module as an architectural blueprint. You don't write "lay foundation, then build wall, then add window." Instead, you provide a blueprint that says, "The final building must have these walls and these windows in these locations." Hardhat Ignition then acts as the expert construction crew that reads your blueprint and builds it reliably. 

 => when you ```run npx hardhat ignition deploy ignition/module/<name of your deployment file> ``` it take care of compling as well as deploying to your blockchain (if specified by you uisng the --network or else it defaults to using a pre-defined, in-memory network named hardhat. This is the default network configured in your hardhat.config.js. and returns you the contract deployed address)

 -----------------------------------------------------------------------------------------------------

 => if you want to create a on device local blockchain using hardhat you could use the command ```npx hardhat node``` returns about 20 accounts with their private keys and balance on you localhost:8545(usually)

 => if you want to interact with your contract using hardhat meaning 
    say you have a public function in your contract (Counter) and you want to do something like Counter.increase() you can use the harhat's console
=> ```npx hardhat console --network localhost```
=> ``` > let counterContract = await ethers.getContractAt("Counter", address)``` // asking hardhat give me a contract at this address and the name of the Contract is Counter
=> ``` > counterContract.increase()``` // simplying accessing the fucntios;
                                OR
=> ``` > let counterFactory = await ethers.getContractFactory("Counter")```//take ABI and create a basic blueprint of the "Counter" contract
=> ``` > let counterInstance = counterFactory.attach(DeploymentAddress)``` // with this you are attaching that blueprint you create in the above line with a particular address of a Counter Contract
=> ``` > counterIntance.increase()```// here you are accesing the fucntions

//Both of these are part of Ethers.js that help you to interact with blockchain

------------------------------------------------------------------------------------------------------

```npx hardhat run <path of the file > <any flags you want to specify>```

=>this command it creats Hardhat Runtime Enviroment (HRE); 
=> a Parallel example to understand this would be how your IDE for c++ creates a runtime enviroment where it fetches everything you required whether it be header files or any other necessary resource you require to run your program and abstract all this to a "build and run" button,similary, HRE creates an enviroment that enables your node.js to run these script becasue on its own node.js has no understanding of what is network, where our blockchain is?, how to connect to it? what is contract? how to get its ABI? these things are foregin to node.js ..so to solve this HRE was developed and it knows about your contracts, how to compiles them, how to connet to a chain,build the right enviroment vairables,etc


------------------------------------------------------------------------------------------------------
```npx hardhat test``` and test folder

This is a critical step you'll always perform before deploying.
 => The test/ folder: The conventional place for your test files.
 => This command automatically finds and runs all files in the test/ folder. It performs these tests on a temporary, in-memory instance of the hardhat network, ensuring your tests are fast and run in a clean, isolated environment every time.

 ------------------------------------------------------------------------------------------------------

  hardhat.config.js. file

 => Its Role is of the brain of the entire project. It's where you define network details (like RPC URLs and private keys for testnets like Sepolia), specify the Solidity compiler version, and add any plugins. Mentioning this file is key to understanding how Hardhat knows what localhost or other networks even mean.
 ------------------------------------------------------------------------------------------------------

 