pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // Addresses `employee_one`, `employee_two` and `employee_three` for the three employees
    
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // Simple equitable distribution by 3. Equally divided
        uint amount = msg.value / 3;

        // Everyone gets 1/3
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        // Transfer confirmation
        msg.sender.transfer(msg.value - amount * 3);
    }

    function() external payable {
        // Ensures integrity of `deposit` function is called in the fallback function!
        deposit();
    }
}

