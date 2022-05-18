const { expect } = require("chai")

describe("inheritance", function () {

  it("log contract name", async function () {
    const contractName = "E"
    const factory = await ethers.getContractFactory(contractName)
    const contract = await factory.deploy()
    await contract.deployed()
    
    const value = await contract.getValue()
    console.log(`name: ${contractName}, value: ${value}`);
  })

})

