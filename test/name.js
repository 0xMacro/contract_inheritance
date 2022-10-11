
describe("inheritance: track chain of super.getValue()", function () {

  it("log contract.getValue()", async function () {
    const contractName = "A"
    const factory = await ethers.getContractFactory(contractName)
    const contract = await factory.deploy()
    await contract.deployed()
    
    const value = await contract.getValue()
    console.log(`  contract: ${contractName},\n  chain of contracts implementing getValue: ${value}`)
  })

})

