// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.24;

// Define a new error called Unauthorized
error Unauthorized();

contract IntroductionToSolidity {

    // Declaration of a state variable to store a string
    string value;

    // Declaration of a state variable to store the contract owner's address
    address owner = msg.sender;

    // Constructor function that runs once when the contract is deployed
    constructor() {
        // Initializes the string value
        value = "myValue";
    }
}