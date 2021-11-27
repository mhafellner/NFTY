const Settings = artifacts.require("NFTYSettings");
const NFTYVaultFactory = artifacts.require("NFTYVaultFactory");


module.exports = function (deployer) {
  deployer.deploy(Settings).then( async () => {
    let settingsInstance = await Settings.deployed();
    deployer.deploy(NFTYVaultFactory, settingsInstance.address);
  });
};
