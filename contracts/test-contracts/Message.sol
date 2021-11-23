// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Message {

  string public message;

  constructor (string memory _message) {
      message = _message;
  }
  
}