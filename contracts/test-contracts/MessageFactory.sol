//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Message.sol";

contract MessageFactory {
    address[] public newContracts;

    function createContract (string memory message) public {
        address newContract = address(new Message(message));
        newContracts.push(newContract);
    }

    function viewMessage () public view returns (string memory) {
        Message con = Message(newContracts[0]);

        return con.message();
    }
}