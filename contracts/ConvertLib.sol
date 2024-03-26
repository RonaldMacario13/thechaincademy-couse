// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.24;

library ConvertLib{
	function convert(uint amount,uint conversionRate) public pure returns (uint convertedAmount)
	{
		return amount * conversionRate;
	}
}
