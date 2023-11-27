// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract DegenToken {
    address public owner;
    string public tokenName;
    string public tokenSymbol;
    uint8 public tokenDecimals;
    uint256 public totalTokenSupply;
    mapping(address => uint256) public accountBalances;
    mapping(address => uint256) public userPrizes; 
    event TokenTransfer(address indexed sender, address indexed receiver, uint256 transferAmount);
    event PrizeRedemption(address indexed user, uint256 prizeCost, string selectedPrize);

    constructor() {
        owner = msg.sender;
        tokenName = "Degen";
        tokenSymbol = "DGN";
        tokenDecimals = 18;
    }

    modifier OwnerOnly() {
        require(msg.sender == owner, "Action restricted to contract owner");
        _;
    }

    modifier ValidateAmount(uint256 amount) {
        require(amount > 0, "Amount must be greater than zero");
        _;
    }

    // Function to mint tokens
    function mintTokens(uint256 amount) public OwnerOnly ValidateAmount(amount) returns (bool success) {
        accountBalances[msg.sender] += amount;
        totalTokenSupply += amount;
        return true;
    }

    // Function to burn tokens
    function burnTokens(uint256 amount) public ValidateAmount(amount) returns (bool success) {
        require(accountBalances[msg.sender] >= amount, "Insufficient token balance");
        accountBalances[msg.sender] -= amount;
        totalTokenSupply -= amount;
        return true;
    }

    // Function to transfer tokens
    function transferTokens(address recipient, uint256 amount) public ValidateAmount(amount) returns (bool success) {
        require(accountBalances[msg.sender] >= amount, "Insufficient token balance");

        accountBalances[msg.sender] -= amount;
        accountBalances[recipient] += amount;
        emit TokenTransfer(msg.sender, recipient, amount);
        return true;
    }

    // Function to redeem a prize
    function redeemPrize(string memory prizeName, uint256 prizeCost) public ValidateAmount(prizeCost) returns (bool success) {
        require(accountBalances[msg.sender] >= prizeCost, "Insufficient balance for prize redemption");

        // Deduct the cost of the prize from the user's balance
        accountBalances[msg.sender] -= prizeCost;

        // Record the user's prize selection
        userPrizes[msg.sender] = prizeCost;

        emit PrizeRedemption(msg.sender, prizeCost, prizeName);

        return true;
    }
}