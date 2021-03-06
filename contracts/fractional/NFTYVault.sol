//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "./Interfaces/IWETH.sol";
// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/token/ERC721/utils/ERC721HolderUpgradeable.sol";
// import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

// contract NFTYVault is ERC20Upgradeable, ERC721HolderUpgradeable, ReentrancyGuard {

//     address public constant weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
//     address public token;
//     address public curator;
//     uint256 public id;
//     uint256 public reservePrice;
//     bool public vaultClosed;

//     /// @notice Event emitted when new curator address is appointed
//     event Curator(address indexed curator);

//     /// @notice Event emitted when curator raises the reserve price
//     event ReservePrice(uint256 price);

//     /// @notice Event emitted when NFT is bought out at reserve price
//     event Buyout(address indexed buyer);

//     /// @notice Event emitted when NFT is redeemed in exchange for burning total supply
//     event Redeem(address indexed redeemer);

//     /// @notice Event emitted when a token holder burns tokens in exchange for ETH in contract
//     event Cashout(address indexed redeemer, uint256 share);

//     modifier onlyCurator {
//         require(msg.sender == curator);
//         _;
//     }

//     function initialize(address _curator, address _token, uint256 _id, uint256 _supply, uint256 _reservePrice, string memory _name, string memory _symbol) external initializer {

//         __ERC20_init(_name, _symbol);
//         __ERC721Holder_init();

//         token = _token;
//         id = _id;

//         curator = _curator;

//         reservePrice = _reservePrice;
//         vaultClosed = false;

//         _mint(_curator, _supply);

//     }

//     /// ---------------------------------------------------
//     /// -------------- CURATOR FUNCTIONS ------------------
//     /// ---------------------------------------------------

//     /// @notice allow curator to update the curator address
//     /// @param _curator the new curator
//     function updateCurator(address _curator) external onlyCurator {
//         curator = _curator;

//         emit Curator(curator);
//     }

//     /// @notice allow curator to raise reserve price
//     /// @param _reservePrice the new reserve price
//     function raiseReservePrice(uint256 _reservePrice) external onlyCurator {
//         require(_reservePrice > reservePrice);

//         reservePrice = _reservePrice;

//         emit ReservePrice(reservePrice);
//     }

//     /// -----------------------------------------------
//     /// ---------- VAULT CLOSING FUNCTIONS ------------
//     /// -----------------------------------------------

//     /// @notice an external function allowing anyone to pay the reserve price and receive the NFTs
//     function buyout() external payable {
//         require(msg.value >= reservePrice, "Payment below reserve price");
//         require(vaultClosed == false, "Vault not active anymore");

//         // transfer erc721 to reserve price payer
//         IERC721(token).transferFrom(address(this), msg.sender, id);

//         vaultClosed = true;

//         emit Buyout(msg.sender);
//     }

//     /// @notice an external function allowing anyone to redeem the NFT in exchange for burning total token supply
//     function redeem() external {
//         _burn(msg.sender, totalSupply());

//         // transfer erc721 to redeemer
//         IERC721(token).transferFrom(address(this), msg.sender, id);

//         vaultClosed = true;

//         emit Redeem(msg.sender);
//     }

//     /// @notice an external function to burn ERC20 tokens to receive ETH from ERC721 token purchase
//     function cashout() external nonReentrant {
//         uint256 bal = balanceOf(msg.sender);
//         require(bal > 0, "cash:no tokens to cash out");
//         uint256 share = bal * address(this).balance / totalSupply();
//         _burn(msg.sender, bal);

//         _sendETHOrWETH(payable(msg.sender), share);

//         emit Cashout(msg.sender, share);
//     }

//     /// -----------------------------------------------
//     /// ------------- INTERNAL FUNCTIONS --------------
//     /// -----------------------------------------------

//     // Will attempt to transfer ETH, but will transfer WETH instead if it fails.
//     function _sendETHOrWETH(address to, uint256 value) internal {
//         // Try to transfer ETH to the given recipient.
//         if (!_attemptETHTransfer(to, value)) {
//             // If the transfer fails, wrap and send as WETH, so that
//             // the auction is not impeded and the recipient still
//             // can claim ETH via the WETH contract (similar to escrow).
//             IWETH(weth).deposit{value: value}();
//             IWETH(weth).transfer(to, value);
//             // At this point, the recipient can unwrap WETH.
//         }
//     }

//     // Sending ETH is not guaranteed complete, and the method used here will return false if
//     // it fails. For example, a contract can block ETH transfer, or might use
//     // an excessive amount of gas, thereby griefing a new bidder.
//     // We should limit the gas used in transfers, and handle failure cases.
//     function _attemptETHTransfer(address to, uint256 value)
//         internal
//         returns (bool)
//     {
//         // Here increase the gas limit a reasonable amount above the default, and try
//         // to send ETH to the recipient.
//         // NOTE: This might allow the recipient to attempt a limited reentrancy attack.
//         (bool success, ) = to.call{value: value, gas: 30000}("");
//         return success;
//     }

// }
