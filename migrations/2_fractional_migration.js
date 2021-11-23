const Settings = artifacts.require("Settings");
const InitializedProxy = artifacts.require("InitializedProxy");
const TokenVault = artifacts.require("TokenVault");
const ERC721VaultFactory = artifacts.require("ERC721VaultFactory");


module.exports = function (deployer) {
  deployer.deploy(Settings).then( async () => {
    let settingsInstance = await Settings.deployed();
    deployer.deploy(TokenVault, settingsInstance);
    deployer.deploy(ERC721VaultFactory, settingsInstance);

    //deployer.deploy(InitializedProxy);
  });
};
