// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract MyToken {
    string public name = "MyToken";
    string public symbol = "MT";
    uint256 public totalSupply = 1000000;
    uint8 public decimals = 18;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 value) public returns (bool) {
      require(to != address(0), "Invalid address");
      require(balanceOf[msg.sender] >= value, "Insufficient balance");

      balanceOf[msg.sender] -= value;
      balanceOf[to] += value;
      emit Transfer(msg.sender, to, value);
      return true;
    }

    function approve(address spender, uint256 value) public returns(bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function tranferFrom(address from, address to, uint256 value) public returns(bool) {
        require(from != address(0), "Invalid addresss");
        require(balanceOf[msg.sender] >= value, "Insufficicent balance");

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(from, to, value);
        return true;
    }
}
