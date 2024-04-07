const hre = require("hardhat");

async function main() {
  // We get the contract factory to deploy
  const Greeter = await hre.ethers.getContractFactory("Greeter");
  
  // Deploy the Greeter contract
  const greeter = await Greeter.deploy("Hello, Hardhat!");

  // Wait for the contract to be deployed
  await greeter.deployed();
  
  // Print the address where the contract is deployed
  console.log("Greeter deployed to:", greeter.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0)) // Exit with success code
  .catch((error) => { // Catch any errors
    console.error(error); // Log the error
    process.exit(1); // Exit with error code
  });
