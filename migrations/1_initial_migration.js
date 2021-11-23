const Migrations = artifacts.require("Migrations");
const Settings = artifacts.require("fractional/Settings");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};

module.exports = function (deployer) {
  deployer.deploy(Settings);
};
