const ISettings = artifacts.require("ISettings");
const IWETH = artifacts.require("IWETH");

const Settings = artifacts.require("Settings");
const InitializedProxy = artifacts.require("InitializedProxy");
const ERC721TokenVault = artifacts.require("ERC721TokenVault");
const ERC721VaultFactory = artifacts.require("ERC721VaultFactory");


module.exports = function (deployer) {
  deployer.deploy(ISettings);
  deployer.deploy(IWETH);

  deployer.deploy(Settings).then( async () => {
    let settingsInstance = await Settings.deployed();
    deployer.deploy(ERC721TokenVault, settingsInstance);
  });
};



module.exports = function (deployer) {
  //deployer.deploy(InitializedProxy, settingsInstance);
  //deployer.deploy(ERC721TokenVault, settingsInstance);
  //deployer.deploy(ERC721VaultFactory, settingsInstance);
};