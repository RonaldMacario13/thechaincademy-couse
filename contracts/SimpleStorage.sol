// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//Contract that changes and returns the current value of the data string
contract SimpleStorage {
   string public data;
    //Changing date
    function set(string memory _data) public {
        data = _data;
    }
    //returning current date value
    function get() view public returns (string memory) {
        return data;
    }
}