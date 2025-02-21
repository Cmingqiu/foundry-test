// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import './SimpleStorage.sol';

contract ExtendSimpleStorage is SimpleStorage{


    function store(uint256 _number) public override  {
        favoriteNumber = _number+5;
    }
}