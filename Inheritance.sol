// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.24;

abstract contract People {

    uint256 age;

    function getAge() public view returns (uint256) {
        return age;
    }

    function yearPasses() public virtual returns (string memory) {
         string memory message = "Happy Birthday!";
        age++;
        return message;
    }

    function ageStage() public view virtual returns (string memory) {
        if (age < 3) {
            return "You are a baby";
        } else if (age < 13) {
            return "You are a child";
        } else if (age >= 13 && age < 18) {
            return "You are a teenager";
        } else if (age >= 18 && age < 65) {
            return "You are an adult";
        } else {
            return "You are an elderly person";
        }
    }

    constructor (uint256 _age) {
        age = _age;
    }

}

contract Person is People {

    function yearPasses() public override returns (string memory) {
         string memory message = "Congratulations, Happy Birthday!";
        age++;
        return message;
    }

}