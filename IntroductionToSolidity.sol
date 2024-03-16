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

    // Public function that returns the string value, accessible only by the owner
    function get() public view onlyOwner() returns(string memory) {
        return value;
    }

    // Public function to set the string value, accessible only by the owner
    function set(string memory _value) public {
        // Checks if the transaction sender is the owner
        if(msg.sender != owner) 
            // If it's not the owner, revert the transaction and emit the Unauthorized error
            revert Unauthorized();

        // If it's the owner, set the new string value
        value = _value;
    }

    // Modifier to restrict access only to the owner
    modifier onlyOwner() {
        // Checks if the transaction sender is the owner
        require(msg.sender == owner, 'only admin');

        // Executes the remaining code of the called function
        _;
    }

}