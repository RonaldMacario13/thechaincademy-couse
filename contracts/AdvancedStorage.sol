// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract implementing advanced storage for unsigned integers
contract AdvancedStorage {
    // Public array to store unsigned integers
    uint[] public ids;

    // Function to add an unsigned integer to the array
    function add(uint id) public {
        ids.push(id); // Adds the unsigned integer to the end of the array
    }

    // Function to get a specific unsigned integer from the array
    function get(uint i) view public returns(uint) {
        return ids[i]; // Returns the unsigned integer at the specified position in the array
    }

    // Function to get all the unsigned integers stored in the array
    function getAll() view public returns(uint[] memory) {
        return ids; // Returns the complete array of unsigned integers
    }

    // Function to get the current size of the array
    function length() view public returns(uint) {
        return ids.length; // Returns the number of elements in the array
    }
}
