// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.19;

// import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// contract MockV3Aggregator is AggregatorV3Interface {
//     int256 private answer;
//     uint8 private decimals_;

//     constructor(uint8 _decimals, int256 _initialAnswer) {
//         decimals_ = _decimals;
//         answer = _initialAnswer;
//     }

//     function decimals() external view override returns (uint8) {
//         return decimals_;
//     }

//     function description() external pure override returns (string memory) {
//         return "MockV3Aggregator";
//     }

//     function version() external pure override returns (uint256) {
//         return 1;
//     }

//     function getRoundData(
//         uint80
//     )
//         external
//         view
//         override
//         returns (uint80, int256, uint256, uint256, uint80)
//     {
//         return (0, answer, 0, 0, 0);
//     }

//     function latestRoundData()
//         external
//         view
//         override
//         returns (uint80, int256, uint256, uint256, uint80)
//     {
//         return (0, answer, 0, 0, 0);
//     }
// }
