// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Base {
    // Private function can only be called
    // - inside this contract
    // Contracts that inherits this contract cannot call this function.
    function privateFunc() private pure returns (string memory) {
        return "rivate function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    // Internal function can be called
    // -inside this contract
    // -insde contracts that inherit this contract.
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // Public functions can be called
    // -inside this contract
    // -inside contracts that inherit this contract
    // -by other contracts and accounts
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // External functions can only be called
    // -by other contracts and accounts
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    // This function will not compile since we're trying to call
    // an external functionhere.
    // function testExternalFunc() public pure returns (string memory) {
    // return externaFunc();
    // }

    // State variables
    string private privateVar = "my private variable";
    string internal internalVal = "my internal variable";
    string public publicVar = "my public variable";
    // State variables cannot be external so this code won't compile.
    // strign external externalVar = "my external variable";
}

contract Child is Base {
    // Inherit contracts do not have access to private functions
    // add state variables.
    // function testPrivateFunc() public pure retunrs (string memory){
    // return privateFunc();
    // }

    // Internal functions call be called inside child contracts.
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}
