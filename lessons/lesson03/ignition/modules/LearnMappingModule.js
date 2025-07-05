const {buildModule} = require('@nomicfoundation/hardhat-ignition/modules')

module.exports = buildModule("MappingModule", (m)=>{
    const mappingDeployedObject = m.contract("LearnMapping")
    return {mappingDeployedObject};
})