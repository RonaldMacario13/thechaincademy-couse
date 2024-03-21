const ConvertLib = artifacts.require("ConvertLib");
const MetaCoin = artifacts.require("MetaCoin");
const DataTypesAndVariables = artifacts.require("DataTypesAndVariables");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin, DataTypesAndVariables);
  deployer.deploy(MetaCoin);
  deployer.deploy(DataTypesAndVariables);
};
