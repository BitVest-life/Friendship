pragma solidity ^0.4.11;

contract Friendship {
     
    mapping (address => uint256) public balanceOf;// This creates an array with all balances
    string public name;
    string public symbol;
    uint8 public decimals;

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function Friendship(
        uint256 initialSupply
        ) {
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
        name = "Friendship";
        symbol = "FRN";
        decimals = 2;
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
    }
}
