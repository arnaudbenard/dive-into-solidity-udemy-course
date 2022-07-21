//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "ONLY_OWNER");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    receive() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function transferAll(address payable destination)
        public
        onlyOwner
        returns (bool)
    {
        bool res = destination.send(address(this).balance);
        return res;
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string memory s1, string memory s2)
        public
        pure
        returns (string memory)
    {
        return string.concat(s1, s2);
    }
}
