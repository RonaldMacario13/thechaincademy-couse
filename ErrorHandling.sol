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

    // Function to transfer ownership of an NFT
    function transferOwnership(uint256 _tokenId, address _newOwner) public {
        // Checks if the caller is the current owner of the NFT
        require(nfts[_tokenId].owner == msg.sender, "You don't own this NFT");

        // Update the owner of the NFT
        nfts[_tokenId].owner = _newOwner;
    }

    // Function to get the owner of an NFT
    function getOwner(uint256 _tokenId) public view returns (address) {
        return nfts[_tokenId].owner;
    }

    // Function to get the token URI of an NFT
    function getTokenURI(uint256 _tokenId) public view returns (string memory) {
        return nfts[_tokenId].tokenURI;
    }

    // Function to grant minting permission to an address
    function grantMinter(address _minter) public onlyOwner {
        minters[_minter] = true;
    }
}