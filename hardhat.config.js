// Require the Hardhat Toolbox library
require("@nomicfoundation/hardhat-toolbox");

// MetaMask private key
metamask_private_key = "0x" + "PRIVATE_KEY"

/** 
 * Export the Hardhat configuration
 * @type import('hardhat/config').HardhatUserConfig 
 */
module.exports = {
  // Solidity version
  solidity: "0.8.24",
  
  // Networks configuration
  networks: {
    // Sepolia testnet configuration
    sepolia: {
      // Sepolia testnet URL
      url: `https://sepolia.infura.io/v3/f77f71e6b66a431bab5fd0ee29da334f`,
      // Accounts associated with Sepolia network (in this case, only one account, MetaMask's private key)
      accounts: [metamask_private_key]
    }
  }
};
