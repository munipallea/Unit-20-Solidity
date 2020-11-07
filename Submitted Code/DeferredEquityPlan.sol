pragma solidity ^0.5.0;

// lvl 3: equity plan
contract DeferredEquityPlan {
    
    address human_resources;
    
    address payable employee; // bob
    bool active = true; // this employee is active at the start of the contract
    
    uint total_shares = 1000; // 1000 shares total
    uint annual_distribution = 250;  // 250 annual distribution
    
    uint start_time = now; // time stamp of initialization stored
    uint unlock_time = now + 365 days; // Set the `unlock_time` to be 365 days from now
    
    uint public distributed_shares; // starts at 0

    constructor(address payable _employee) public {
        human_resources = msg.sender;
        employee = _employee;
    }

    function distribute() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract not active.");
        // Add "require" statements to enforce that:
        require(unlock_time <= now, "Account is locked!"); // 1: `unlock_time` is less than or equal to `now`
        require(distributed_shares < total_shares, "No more shares to distribute."); // 2: `distributed_shares` is less than the `total_shares`

        unlock_time += 365 days; // Add 365 days to the `unlock_time`

        distributed_shares = (now - start_time) / 365 days * annual_distribution; // Calculate the shares distributed by using the function (now - start_time) / 365 days * the annual distribution

        // double check in case the employee does not cash out until after 5+ years. This is akin to a lumpsum
        if (distributed_shares > 1000) {
            distributed_shares = 1000;
        }
    }

    // Only permit HR and Employee Deactivate
    function deactivate() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to deactivate this contract.");
        active = false;
    }

    // Message to revert any Ether set as not permissible
    function() external payable {
        revert("Do not send Ether to this contract!");
    }
}
