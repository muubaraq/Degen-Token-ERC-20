# DegenToken Contract

`DegenToken` is a smart contract developed on the Ethereum blockchain. It is designed to create a token economy where users can mint, transfer, burn tokens, and redeem prizes. This contract is an example of a basic ERC-20 token with extended functionalities.

## Features

-   **Mint Tokens**: Only the contract owner can mint new tokens.
-   **Burn Tokens**: Any token holder can burn their tokens to reduce the total supply.
-   **Transfer Tokens**: Token holders can transfer tokens to another address.
-   **Redeem Prizes**: Users can redeem prizes with their tokens.

## Contract Details

-   **Contract Name**: `DegenToken`
-   **Token Name**: `Degen`
-   **Token Symbol**: `DGN`
-   **Decimals**: 18
-   **Total Supply**: Managed by mint and burn functions.

## Functions

### `mintTokens(uint256 amount)`

-   **Access**: Owner only
-   **Description**: Mints new tokens to the owner's account.

### `burnTokens(uint256 amount)`

-   **Access**: Public
-   **Description**: Burns the specified amount of tokens from the caller's balance.

### `transferTokens(address recipient, uint256 amount)`

-   **Access**: Public
-   **Description**: Transfers the specified amount of tokens to the recipient.

### `redeemPrize(string memory prizeName, uint256 prizeCost)`

-   **Access**: Public
-   **Description**: Redeems a prize for the specified cost from the caller's balance.

## Events

-   **`TokenTransfer`**: Emitted on token transfer.
-   **`PrizeRedemption`**: Emitted when a prize is redeemed.

## Setup and Deployment

1.  Install Solidity (version 0.8.18 or compatible).
2.  Use a development framework like Truffle or Hardhat for deployment.
3.  Deploy to an Ethereum testnet or mainnet.

## Usage

-   Interact with the contract using Ethereum wallet software like MetaMask and a web3 provider.
-   Ensure you have ETH for transaction fees.

## Disclaimer

This contract is for demonstration purposes. Please conduct thorough testing and auditing before using it in a production environment.