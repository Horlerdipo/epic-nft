const main = async () => {

    console.log("about to deploy to rinkeby")
    const contractFactory = await hre.ethers.getContractFactory("AnotherEpicNFT");
    const nftContract = await contractFactory.deploy();
    await nftContract.deployed();
    console.log(`Contract deployed on:${nftContract.address}`);

    let txn = await nftContract.generateNFT();
    await txn.wait();

    let txn2 = await nftContract.generateNFT();
    await txn2.wait();
    console.log("NFTs generated");
}

const runMain = async () => {

    try {
        await main();
        process.exit(0);
    } catch (error) {
        process.exit(1);
        console.log(error);
    }
}

runMain();