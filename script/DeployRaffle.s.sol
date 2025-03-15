// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Raffle} from "../src/Raffle.sol";

contract DeployRaffle is Script {

    function run() external returns (Raffle, HelperConfig) {
    HelperConfig helperConfig = new HelperConfig(); // This comes with our mocks!
    (
        uint256 entranceFee;
        uint256 interval;
        address vrfCoordinator;
        bytes32 gasLane;
        uint256 subscriptionId;
        uint32 callbackGasLimit;

    ) = helperConfig.getConfig();

    vm.startBroadcast();
    Raffle raffle = new Raffle(
        entranceFee,
        interval,
        vrfCoordinator,
        gasLane,
        subscriptionId,
        callbackGasLimit
    );
    vm.stopBroadcast();

    return (raffle, helperConfig);


}

}