// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

/// @custom:security-contact zionverse@gmail.com
contract Vishwaas is ERC721, ERC721Burnable, Ownable {
    using Strings for uint256;

    constructor() ERC721("Vishwaas", "VSW") {}
    

    function _baseURI() internal pure override returns (string memory) {
        return "https://gateway.pinata.cloud/ipfs/QmPVm9gZGqaGRZPvCZXLh39PjKenoe6NiF9nMpSbBuFNGj/";
    }

    // //overrriding
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString(), ".json")) : "";
       // return "https://gateway.pinata.cloud/ipfs/QmTNFBotGP8XjXAZAvGmGK55ksafCRvundjEhh572dGsLP";
    }

    function contractURI() public view returns (string memory) {
        return "https://gateway.pinata.cloud/ipfs/QmYqauexwKH7U31u5Rbx1C1SUNEZW447ESTqc8BkXZHzoT";
    
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}
