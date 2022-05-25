//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";


contract EpicNFT is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    constructor() ERC721 ("ASHNFT","ASH"){
        console.log("First NFT!!!");
    }   

    function generateNFT() public {

        uint256 itemId = _tokenIds.current();

        _safeMint(msg.sender,itemId);
        
        _setTokenURI(itemId,"https://jsonkeeper.com/b/PIBK");

        _tokenIds.increment();
        console.log("An NFT w/ ID %s has been minted to %s", itemId, msg.sender);
    }
}