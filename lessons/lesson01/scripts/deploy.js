const hre = require("hardhat");

async function main() {
  // Get the contract factory for our simpleStorage contract
  const simpleStorageFactory = await hre.ethers.getContractFactory("simpleStorage");

  // Deploy the contract
  const simpleStorage = await simpleStorageFactory.deploy();

  // Wait for the deployment to be confirmed
  await simpleStorage.waitForDeployment();

  console.log(
    `simpleStorage deployed to ${simpleStorage.target}`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
