// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
        // return simpleStorage;
    }

    function sfStore(uint256 index, uint256 number) public {
        SimpleStorage simpleStorage = simpleStorageArray[index];
        simpleStorage.store(number);
    }

    function sfGet(uint256 index) public view returns (uint256) {
        return simpleStorageArray[index].retrieve();
    }
}
