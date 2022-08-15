import { ethers } from "hardhat";

async function main() {
  // const lockedAmount = ethers.utils.parseEther("1");
  // let valid1, valid2, valid3, valid4;
  let [valid1, valid2, valid3, valid4, valid5] = await ethers.getSigners();

  const MultisigFactory = await ethers.getContractFactory("MultiSigFactory");
  const multisigFactory = await MultisigFactory.deploy();

  await multisigFactory.deployed();

  console.log(
    "factory contract deployed to this address",
    multisigFactory.address
  );
  // let cloned = await multisigFactory.cloneMultiSig([
  //   valid1.address,
  //   valid2.address,
  //   valid3.address,
  //   valid4.address,
  //   valid5.address,
  // ]);

  const clone = await multisigFactory.cloneMultiSig([
    "0x7A3E0DFf9B53fA0d3d1997903A48677399b22ce7",
    "0x9ee15CF9EC4B3830bBedA501d85F5329Ea3C595C",
    "0x9ee15CF9EC4B3830bBedA501d85F5329Ea3C595C",
    "0x85f20a6924A61904AB44243C7e2c771B3bE46734",
    "0x85f20a6924A61904AB44243C7e2c771B3bE46734",
    "0x2DBdd859D9551b7d882e9f3801Dbb83b339bFFD7",
    "0x88538EE7D25d41a0B823A7354Ea0f2F252AD0fAf",
    "0x5D63564EeF4657F360343196A7bd86ae18d3a92A",
    "0x12896191de42EF8388f2892Ab76b9a728189260A",
    "0x924843c0c1105b542c7e637605f95F40FD07b4B0",
    "0xB632cAf3119860599ce162Fad8753fc4198037b4",
    "0x20497F37a8169c8C9fA09411F8c2CFB7c90dE5d1",
    "0xCb3416Fc84c0e9f72F169DD8e53dBc06220591BF",
    "0x21c1229D4b781F4F7A95dEb4022B57f346af4CEF",
    ]);
  let result = (await clone.wait());
  // let result1 = (await clone2.wait()).logs[0].topics[0];
  // let result2 = (await clone2.wait()).logs[0].topics[1];
  // let result3 = (await clone2.wait()).logs[0].topics[2];

  console.log(result, "factory cloned successfully");
  // console.log("we are the logger", result1, result2, result3);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
