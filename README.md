# SOLIDITY

__Title__: SOLIDITY and ETHEREUM SMART CONTRACTS <br />
__Submitted by__: Amar Munipalle <br />



## Background

Smart contracts to automate certain compensation plans. Per Ethereum a “smart contract” is simply a piece of code that is running on Ethereum. It’s called a “contract” because code that runs on Ethereum can control valuable things like ETH or other digital assets.

In this exercise we Use Ethereum payout to

* Pay associate-level employees quickly and easily and in a simple manner

* Distribute profits to different tiers of employees; with executive suite garnering bulk of compensation

* Distribute company shares for employees in a "deferred equity incentive plan" automatically. By activating contract on certain dates. This is the most valuable implementation

![Remix-Test](Images/AssociateProfitSplitter.png)

![Remix-Test](Images/DeferredEquityPlan.png)

![Remix-Test](Images/TieredProfitSplitter.png)

## Immutability and Security

Secutiry is assured by only permitting Employee or HR to de-activate plan.
For the deferred program utilization of time stamps and keeping score of share balances ensures that contract cannot be activated prior or be excessively drawn.
Also a lumpsum is credited after 5 years if facility has not been drawn