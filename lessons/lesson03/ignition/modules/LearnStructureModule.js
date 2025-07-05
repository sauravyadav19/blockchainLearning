const {buildModule} = require('@nomicfoundation/hardhat-ignition/modules')

module.exports = buildModule('StructureModule', (m) => {
    const deployModule = m.contract('LearnStructures');
    return {deployModule};
})