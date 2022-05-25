//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
import {Base64} from "./libraries/Base64.sol";
import {Generator} from "./libraries/Generator.sol";


contract AnotherEpicNFT is ERC721URIStorage,Generator {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("ASHNFT", "ASH") {
        
    }

    function pickRandomColor(uint256 tokenId) public view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked("COLOR", Strings.toString(tokenId))));
        rand = rand % Generator.colors.length;
        return Generator.colors[rand];
    }

    function pickRandomFirstWord(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        uint256 rand = random(
            string(abi.encodePacked("Sasuke", Strings.toString(tokenId)))
        );
        rand = rand % Generator.firstWords.length;
        return Generator.firstWords[rand];
    }

    function pickRandomSecondWord(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        uint256 rand = random(
            string(abi.encodePacked("Sasuke", Strings.toString(tokenId)))
        );
        rand = rand % Generator.secondWords.length;
        return Generator.secondWords[rand];
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function generateNFT() public  {
        uint256 itemId = _tokenIds.current();
        string memory combinedWord = string(
            abi.encodePacked(
                pickRandomFirstWord(itemId),
                " of ",
                pickRandomSecondWord(itemId)
            )
        );

        string memory randomColor = pickRandomColor(itemId);

        string memory finalSvg = string(
            abi.encodePacked(Generator.baseSvg, randomColor,Generator.svgPartTwo,combinedWord, "</text></svg>")
        );

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        combinedWord,
                        '", "description": "Naruto random names and clan.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(finalSvg)),
                        '"}'
                    )
                )
            )
        );

        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        _safeMint(msg.sender, itemId);

        _setTokenURI(itemId, finalTokenUri);

        _tokenIds.increment();
        console.log(
            "An NFT w/ ID %s has been minted to %s",
            itemId,
            msg.sender
        );
        emit NewEpicNFTMinted(msg.sender, itemId);
    }

    event NewEpicNFTMinted(address sender, uint256 tokenId);
}
