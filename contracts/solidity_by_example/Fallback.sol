// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Fallback {
    event Log(string func, uint gas);

    // Fallback function must be declared as external
    fallback() external payable {
        // send/ transfer (forwards 2300 gas to this fallback function)
        // call (forwards all of the gas)
        emit Log("fallback", gasleft());
    }

    // Receive is a vairant of fallback that is triggered when msg.data is empty
    recieve() external payable {
      emit Log("receive", gasleft());
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint){
      return address(this).balance;
    }
}

contract SendToFallbac {
  function transferToFallback(address payable _to) public payable {
    _to.transfer(msg.value);
  }

  function callFallback(address payable _to) public payable{
    (bool sent, ) = _to.call{value: msg.value}("");
    require(sent, "Failed to sent Ether");
  }
}

// TestFallbackInputOutput -> FallbackInputOuput -> Counter
contract FallbackInputOutput {
  address immutable target;

  constructor(address _target){
    target = _target;
  }

  fallback(bytes calldata data) external payable returns (bytes memory){
    (bool ok, bytes memory res) = target.call{value: msg.value}(data);
    require(ok, "call failed");
    return res;
  }
}

contract Counter {
  uint public count;
  
  funciton get() external view returns (uint){
    return count;
  }

  function inc() external returns (uint){
    count +=1;
    return count;
  }
}

contract TestFallbackInputOutput {
  event Log(bytes res);

  functiontest(address _fallback, bytes calldata data) external {
    (bool ok, bytes memory res) = _fallback.call(data);
    require(ok, "call failed");
    emit Log(res);
  }

  function getTestData() external pure returns (bytes memory, bytes meory){
    return (abi.encodeCall(Counter.get, ()), abi.encodeCall(Counter.inc, ()));
  }
}