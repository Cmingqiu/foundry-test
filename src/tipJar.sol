// SPDX-License-Identifier: MIT
pragma solidity >0.8.2;

contract TipJar {
    address private owner;
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "must be owner!");
        _;
    }

    // 支付eht给合约
    function tip() public payable {
        require(msg.value > 0, "amount should be greater than 0");
    }

    // 从合约中提现eth
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "balance is 0");
        payable(owner).transfer(balance);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
