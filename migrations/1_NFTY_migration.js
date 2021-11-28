const NFTYVaultFactory = artifacts.require("NFTYVaultFactory");


module.exports = function (deployer) {
  deployer.deploy(NFTYVaultFactory)
};
