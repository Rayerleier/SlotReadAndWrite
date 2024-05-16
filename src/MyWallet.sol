pragma solidity ^0.8.0;
contract MyWallet {
    string public name;
    mapping(address => bool) private approved;
    bytes32 private constant OWNER_SLOT = keccak256("OWNER_SLOT");

    modifier auth() {
        require(msg.sender == getOwner(), "Not authorized");
        _;
    }

    constructor(string memory _name) {
        name = _name;
        setOwner(msg.sender);
    }

    function transferOwernship(address _addr) public auth {
        require(_addr != address(0), "New owner is the zero address");
        require(getOwner() != _addr, "New owner is the same as the old owner");
        setOwner(_addr);
    }

    function getOwner() public view returns (address owner) {
        bytes32 slot = OWNER_SLOT;
        assembly {
            owner := sload(slot)
        }
    }
    function setOwner(address owneraddress) internal {
        bytes32 slot = OWNER_SLOT;

        assembly {
            sstore(slot, owneraddress)
        }
    }
}
