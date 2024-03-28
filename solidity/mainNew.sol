// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Импорт интерфейса ERC-20
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TimeCapsule {
    address private _owner;

    struct Comment {
        uint256 id;
        string text;
    }

    struct Human {
        uint256 id;
        string name;
        string description;
        string urlIcon;
        uint256[] commentsId;
    }

    modifier onlyOwner() {
        require(msg.sender == _owner, "Not the owner");
        _; 
    }

    uint256 commentId = 0;
    uint256 humanId = 0;
    mapping (uint256 => Human) persons;

    constructor() {
        _owner = msg.sender;
    }
   
}
