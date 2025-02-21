// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Fundme {
    address public ownerAddress; // owner的账户地址
    mapping(address => uint256) private addrToAmount; // 账户地址映射金额
    address[] public addrs; // 发送来的账户地址
    constructor() {
        ownerAddress = msg.sender; // address(this);   // assign contract address
    }

    event Transfer(address indexed _addr, uint256 _value);

    modifier amountRequire(uint _value) {
        require(_value > 0.1 * 1e18, "amount is not greater than 0.1eth");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == ownerAddress, "current user is not owner");
        _;
    }

    // 给合约发送token
    function fund() public payable amountRequire(msg.value) {
        addrToAmount[msg.sender] = msg.value;
        addrs.push(msg.sender);
        emit Transfer(msg.sender, msg.value);
    }

    // owner提现
    function withdraw() public onlyOwner {
        uint256 balance = getBalance();
        require(balance > 0, "balance is not greater than 0");
        // payable(msg.sender).transfer(balance); // transfer 上限2300gas，超出这个上限会报错并且自动回滚交易revert

        // bool paySuccess = payable(msg.sender).send(balance); // 上限2300gas，超出这个上限 不会报错，需要结合require
        // require(paySuccess,"this transaction is failed");

        (bool callSuccess, ) = payable(msg.sender).call{value: balance}(""); // bytes memory dataReturneds
        require(callSuccess, "call filed");

        // 提现完后重置映射和数组
        for (uint256 i = 0; i < addrs.length; i++) {
            addrToAmount[addrs[i]] = 0;
        }
        addrs = new address[](0);
    }

    // 查看合约余额
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
