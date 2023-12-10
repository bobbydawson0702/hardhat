// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Calculation {
    uint256 num1;
    uint256 num2;
    address owner;

    mapping(address => uint256) public storesum;
    mapping(address => uint256) public storesub;

    constructor(uint256 initNum1, uint256 initNum2)  {
        num1 = initNum1;
        num2 = initNum2;
        owner = msg.sender;
    }

    modifier onlyOwner {
      require(msg.sender == owner, "require onlyOwner");
      _;
   }



    function sum(address sender) internal {
        storesum[sender] = num1 + num2;
    }

    function sub(address sender) internal {
        storesub[sender] = num1 - num2;
    }

    function calcsum(address sender) external onlyOwner {
        sum(sender);
    }

    function calcsub(address sender) external onlyOwner  {
        require(num1 > num2, "require only positive");
        sub(sender);
    }



    function getSum(address sender) public view returns (uint) {
        return storesum[sender];
    }
    function getsub(address sender) public view returns (uint) {
        return storesub[sender];
    }
}