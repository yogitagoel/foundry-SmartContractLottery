// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";

contract HelperConfig is Script {
    struct NetworkConfig {
        uint256 entranceFee;
        uint256 interval;
        address vrfCoordinator;
        bytes32 gasLane;
        uint256 subscriptionId;
        uint32 callbackGasLimit;
    }

    NetworkConfig public localNetworkConfig;

    constructor() {
        networkConfigs[ETH_SEPOLIA_CHAIN_ID] = getSepoliaEthConfig();
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        return
            NetworkConfig({
                entranceFee: 0.01 ether,
                interval: 30,
                vrfCoordinator: 0x9DdfaCa8183c41ad55329BdeeD9F6A8d53168B1B,
                gasLane: 0x787d74caea10b2b357790d5b5247c2f63d1d91572a9846f780606e4d953677ae,
                subscriptionId: 0,
                callbackGasLimit: 500000
            });
    }

    function getLocalConfig() public pure returns (NetworkConfig memory) {
        return
            NetworkConfig({
                entranceFee: 0.01 ether,
                interval: 30,
                vrfCoordinator: address(0),
                gasLane: "",
                callbackGasLimit: 500000,
                subscriptionId: 0
            });
    }

    function getOrCreateAnvilEthConfig() public returns (NetworkConfig memory) {
    if (localNetworkConfig.vrfCoordinator != address(0)) {
        return localNetworkConfig;
}

    function getConfigByChainId(uint256 chainId) public view returns (NetworkConfig memory) {
    if (networkConfigs[chainId].vrfCoordinator != address(0)) {
        return networkConfigs[chainId];
    } else if (chainId == LOCAL_CHAIN_ID) {
        return getOrCreateAnvilEthConfig();
    } else {
        revert HelperConfig__InvalidChainId();
    }
}
}
