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

}
