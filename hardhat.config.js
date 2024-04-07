require("@nomicfoundation/hardhat-toolbox");


metamask_private_key = "0x" + "6d1dccf82564fd00d99f862beed060619e9a2d887b7e6729ae8745c72d87b05b"

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  
  networks: {
    sepolia: {
      url: `https://sepolia.infura.io/v3/f77f71e6b66a431bab5fd0ee29da334f`,
      accounts: [metamask_private_key]
    }
  }
};