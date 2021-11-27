//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

import "@chainlink/contracts/src/v0.8/interfaces/KeeperCompatibleInterface.sol";

import "./InitializedProxy.sol";
import "./NFTYSettings.sol";
import "./NFTYVault.sol";

contract NFTYVaultFactory is Ownable, Pausable, KeeperCompatibleInterface {
    /// @notice the number of ERC721 vaults
    uint256 public vaultCount;

    /// @notice the mapping of vault number to vault contract
    mapping(uint256 => address) public vaults;

    /// @notice a settings contract controlled by governance
    address public immutable settings;
    /// @notice the NFTYVault logic contract
    address public immutable logic;

    uint256 public interval;

    uint256 public lastTimeStamp;

    event Mint(
        address indexed token,
        uint256 id,
        uint256 price,
        address vault,
        uint256 vaultId
    );

    constructor(address _settings) {
        settings = _settings;
        logic = address(new NFTYVault(_settings));
        interval = 1 weeks;
        lastTimeStamp = block.timestamp;
    }

    /// @notice the function to mint a new vault
    /// @param _name the desired name of the vault
    /// @param _symbol the desired sumbol of the vault
    /// @param _token the ERC721 token address fo the NFT
    /// @param _id the uint256 ID of the token
    /// @param _reservePrice the reserve price for a potential NFT buyout available to anyone
    /// @return the ID of the vault
    function mint(
        address _token,
        address _royaltyToken,
        uint256 _id,
        uint256 _supply,
        uint256 _reservePrice,
        string memory _name,
        string memory _symbol
    ) external whenNotPaused returns (uint256) {
        bytes memory _initializationCalldata = abi.encodeWithSignature(
            "initialize(address,address,address,uint256,uint256,uint256,string,string)",
            msg.sender,
            _token,
            _royaltyToken,
            _id,
            _supply,
            _reservePrice,
            _name,
            _symbol
        );

        address vault = address(
            new InitializedProxy(logic, _initializationCalldata)
        );

        emit Mint(_token, _id, _reservePrice, vault, vaultCount);

        IERC721(_token).safeTransferFrom(msg.sender, vault, _id);

        vaults[vaultCount] = vault;
        vaultCount++;

        return vaultCount - 1;
    }

    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }

    /// -----------------------------------------------
    /// -------------- KEEPER FUNCTIONS ---------------
    /// -----------------------------------------------

    function checkUpkeep(
        bytes calldata /* checkData */
    )
        external
        view
        override
        returns (bool upkeepNeeded, bytes memory performData)
    {
        upkeepNeeded = (block.timestamp - lastTimeStamp) > interval;

        if (upkeepNeeded) {
            bytes1 data = 0x00;
            bytes1 pos = 0x01;

            for (uint256 i = 0; i < vaultCount; i++) {
                if (NFTYVault(vaults[i]).snapshotNeeded()) {
                    data |= pos;
                }

                pos = pos << 1;

                if (i % 8 == 7 || i == vaultCount - 1) {
                    performData = bytes.concat(performData, data);
                    data = 0x00;
                    pos = 0x01;
                }
            }
        }
    }

    function performUpkeep(bytes calldata performData) external override {
        lastTimeStamp = block.timestamp;

        for (uint256 i = 0; i < performData.length; i++) {
            bytes1 data = performData[i];

            bytes1 pos = 0x01;
            for (uint256 j = 0; j < 8; j++) {
                if (data & pos == pos) {
                    NFTYVault(vaults[i]).createSnapshot();
                }
                pos = pos << 1;
            }
        }
    }
}
