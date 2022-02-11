/* Version de Solidity */
pragma solidity ^0.8.0;

/* Contratos OpenZepellin Default */
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyFirstNFT is ERC721URIStorage {

    using Counters for Counters.Counter;

    /* Contador de ID */
    Counters.Counter private _tokenIds;

    mapping(string => uint8) hashes;

    constructor() public ERC721("MyFirstNFT", "FNFT") {}
   
    function awardItem(address recipient, string memory hash, string memory metadata)
    public returns (uint256) { 

      require(hashes[hash] != 1); 

      hashes[hash] = 1; 

      /* Incremento de registros */
      _tokenIds.increment(); 

      uint256 newItemId = _tokenIds.current(); 

      _mint(recipient, newItemId);  _setTokenURI(newItemId, metadata); 

      return newItemId;
    }

    function tokenURI(uint256 tokenId)
      public
      view
      override(ERC721URIStorage)
      returns (string memory)
    {
      return super.tokenURI(tokenId);
    }
    
}