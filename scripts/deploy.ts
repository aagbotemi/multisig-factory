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

  const clone2 = await multisigFactory.cloneMultiSig([
      "0x8D5b0F873c00F8e8EA7FEF0C24DBdC5Ac2758D26",
      "0x7A3E0DFf9B53fA0d3d1997903A48677399b22ce7",
      "0xBd5C5e901FF45f7BC6922703f28eb09deA050278",
      // valid1.address,
      // valid2.address,
      // valid3.address,
      // valid4.address,
      // valid5.address,
    ]);
  let result = (await clone2.wait());
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
