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
}