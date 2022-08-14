require("dotenv").config({ path: ".env" });
import { BytesLike } from "ethers";
import { ethers } from "hardhat";
// import * as dotenv from "dotenv";

// import IMultiSig from "../typechain-types/Imultisig.sol"

async function main() {
  let provider = {
    PrivateKey: process.env.PRIVATE_KEY as BytesLike,
    URL: process.env.ROPSTEN_URL,
  };
  const provider2 = ethers.getDefaultProvider("ropsten", provider.URL);
  let wallet = new ethers.Wallet(provider.PrivateKey, provider2);
  const _value = ethers.utils.parseEther("1");

  const CONTRACTADDRESS = "0x6e828b59fc799b6ef92e42d2f39e438a7477f469";
  const MULTISIG = await ethers.getContractAt("IMultiSig", CONTRACTADDRESS);
  await wallet.sendTransaction({ to: CONTRACTADDRESS, value: _value });
  console.log("contractBalance", await MULTISIG.contractBalance());

  const withdraw = await MULTISIG.withdrawEther(_value); // request for withdrawal
  console.log("WITHDRAW ETHER: ", withdraw);
  
  const approve = await MULTISIG.Approve(3); // approve a withdraw transaction
  console.log("APPROVE WITHDRAWAL: ", approve);
  
  const bal = await MULTISIG.contractBalance(); // get the balance of the contract
  console.log("Balance of contract: ", bal);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});