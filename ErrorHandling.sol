// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.24;

// Define a new error called Unauthorized
error TokenIdIsAlreadyInUse();

contract BasicNFT {

    // Define a struct to represent an NFT
    struct NFT {
        address owner;
        string tokenURI;
    }

    // Mapping from token ID to NFT
    mapping(uint256 => NFT) public nfts;

    // Mapping to store minting permissions
    mapping(address => bool) public minters;

    // Declaration of a state variable to store the contract owner's address
    address public owner;

    // Event emitted when a new NFT is minted
    event NFTMinted(uint256 indexed tokenId, address indexed owner, string tokenURI);

    // Constructor function that runs once when the contract is deployed
    constructor() {
        // Set the contract owner
        owner = msg.sender;
        // Allow owner to mint NFTs by default
        minters[msg.sender] = true;
    }

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Modifier to check if the caller is allowed to mint NFTs
    modifier onlyMinter() {
        require(minters[msg.sender], "You are not authorized to mint NFTs");
        _;
    }

    // Function to mint a new NFT
    function mintNFT(uint256 _tokenId, string memory _tokenURI) public onlyMinter {
        // Checks if the token ID is not already in use
        if (nfts[_tokenId].owner != address(0))
            revert TokenIdIsAlreadyInUse();

        // Create a new NFT with the given token ID and token URI
        NFT memory newNFT = NFT(msg.sender, _tokenURI);
        nfts[_tokenId] = newNFT;

        // Emit an event for the minted NFT
        emit NFTMinted(_tokenId, msg.sender, _tokenURI);
    }

}