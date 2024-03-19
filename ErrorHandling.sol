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
}