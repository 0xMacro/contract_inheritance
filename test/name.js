const { expect } = require("chai")

describe("inheritance", function () {

  it("log contract.getValue()", async function () {
    const contractName = "D"
    const factory = await ethers.getContractFactory(contractName)
    const contract = await factory.deploy()
    await contract.deployed()
    
    const value = await contract.getValue()
    console.log(`name: ${contractName}, value: ${value}`);
  })

})

