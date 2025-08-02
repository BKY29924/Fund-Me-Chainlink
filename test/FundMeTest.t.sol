//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

// import {MockV3Aggregator} from "./MockV3Aggregator.t.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    // MockV3Aggregator mockV3Aggregator;
    DeployFundMe deployFundMe;

    function setUp() external {
        // mockV3Aggregator = new MockV3Aggregator(8, 2000e8);
        // fundMe = new FundMe(address(mockV3Aggregator));
        deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testMinimumDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerMsgSender() public view {
        // assertEq(fundMe.getOwner(), address(this));
        assertEq(fundMe.getOwner(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() public view {
        assertEq(fundMe.getVersion(), 4);
        console.log(fundMe.getVersion());
    }

    function testForkedBlockInfo() public view {
        console.log("Chain ID:", block.chainid);
        console.log("Block number:", block.number);
        console.log("Block hash:");
        console.logBytes32(blockhash(block.number - 1));
    }
}
