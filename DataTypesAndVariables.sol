// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.24;

// Define a new error called Unauthorized
error Unauthorized();

contract BasicNFT {

    // Define a struct to represent an NFT
    struct NFT {
        address owner;
        string tokenURI;
    }

    // Mapping from token ID to NFT
    mapping(uint256 => NFT) public nfts;

    // Declaration of a state variable to store the contract owner's address
    address public owner;

    // Event emitted when a new NFT is minted
    event NFTMinted(uint256 indexed tokenId, address indexed owner, string tokenURI);

    // Constructor function that runs once when the contract is deployed
    constructor() {
        // Set the contract owner
        owner = msg.sender;
    }

    // Function to mint a new NFT
    function mintNFT(uint256 _tokenId, string memory _tokenURI) public {
        // Checks if the caller is the owner
        require(msg.sender == owner, "Only the owner can mint NFTs");
        // Checks if the token ID is not already in use
        require(nfts[_tokenId].owner == address(0), "Token ID already exists");

        // Create a new NFT with the given token ID and token URI
        NFT memory newNFT = NFT(msg.sender, _tokenURI);
        nfts[_tokenId] = newNFT;

        // Emit an event for the minted NFT
        emit NFTMinted(_tokenId, msg.sender, _tokenURI);
    }
}