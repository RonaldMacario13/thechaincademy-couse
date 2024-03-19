// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.24;

// Importing the SafeMath library
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

// Simple contract that uses SafeMath for basic arithmetic
contract Library {
    
    // Using SafeMath for uint256 data type
    using SafeMath for uint256;

    // Declaring a public state variable to store the result of the subtraction operation
    uint256 public result;

    // Function to subtract two uint256 numbers
    function sub(uint256 _a, uint256 _b) external {
        // Performing the subtraction operation using the sub function from SafeMath library
        result = _a.sub(_b);
    }
}
