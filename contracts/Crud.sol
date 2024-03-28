// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract for CRUD operations (Create, Read, Update, Delete) on users
contract Crud {
    // Struct to represent a user
    struct User {
        uint id; // User ID
        string name; // User name
    }
    // Array to store all users
    User[] public users;
    // Counter for assigning IDs to new users
    uint public nextId = 1;

    // Function to create a new user
    function create(string memory name) public {
        // Pushes a new user with the next available ID and the provided name
        users.push(User(nextId, name));
        // Increments the nextId for the next user
        nextId++;
    }

    // Function to read the details of a user by ID
    function read(uint id) view public returns(uint, string memory) {
        // Finds the index of the user with the given ID
        uint i = find(id);
        // Returns the ID and name of the user found
        return(users[i].id, users[i].name);
    }

    // Function to update the name of a user by ID
    function update(uint id, string memory name) public {
        // Finds the index of the user with the given ID
        uint i = find(id);
        // Updates the name of the user at the found index
        users[i].name = name;
    }

    // Function to delete a user by ID
    function destroy(uint id) public {
        // Finds the index of the user with the given ID
        uint i = find(id);
        // Deletes the user at the found index
        delete users[i];
    }

    // Internal function to find the index of a user by ID
    function find(uint id) view internal returns(uint) {
        // Iterates through all users
        for(uint i = 0; i < users.length; i++) {
            // Checks if the ID of the current user matches the given ID
            if(users[i].id == id) {
                // Returns the index of the user if found
                return i;
            }
        }
        // Reverts with an error message if the user is not found
        revert('user does not exist!');
    }
}
