const Settings = artifacts.require("Settings");
const ERC721VaultFactory = artifacts.require("ERC721VaultFactory");


module.exports = function (deployer) {
  deployer.deploy(Settings).then( async () => {
    let settingsInstance = await Settings.deployed();
    deployer.deploy(ERC721VaultFactory, settingsInstance.address);
  });
};
