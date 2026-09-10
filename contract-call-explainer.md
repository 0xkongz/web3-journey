# What happens when you call a contract?

<!-- Target: under 300 words total. Each section has a word budget so you don't overrun.
     Delete these comments as you fill them in. -->

## 1. Two kinds of call
When calling a contract, there are two kinds of call:
- Read: no gas cost, read the on-chain state
- Write: gas cost is consumed to execute the call. Changes the on-chain state

We send a transaction from our wallet address to the contract address, with a calldata inside our transaction.
The contract reads the calldata and knows which function we are calling, and executes the code.
Gas is spent as the contract runs.
The contract returns success or revert (failed)