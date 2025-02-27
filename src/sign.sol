// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Sign {
    struct Status {
        string name;
        string message;
    }
    mapping(address => Status) private addressToStatus;

    function set(string memory _name, string memory _messsage) public {
        addressToStatus[msg.sender].name = _name;
        addressToStatus[msg.sender].message = _messsage;
    }

    function get() public view returns (string memory, string memory) {
        return (
            addressToStatus[msg.sender].name,
            addressToStatus[msg.sender].message
        );
    }
}
