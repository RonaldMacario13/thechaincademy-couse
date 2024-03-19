// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.24;

abstract contract People {

    uint256 age;

    function getAge() public view returns (uint256) {
        return age;
    }


}