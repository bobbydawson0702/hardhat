//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Immutable {
    // coding conventions to uppercsse constant variables
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}
