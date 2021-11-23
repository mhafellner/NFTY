const MessageFactory = artifacts.require("MessageFactory");


module.exports = function (deployer) {
  deployer.deploy(MessageFactory).then( async () => {
    let instance = await MessageFactory.deployed();

    await instance.createContract("Hello World!");
    let string = await instance.viewMessage.call();

    console.log("Message: " + string);

    //deployer.deploy(InitializedProxy);
  });
};
