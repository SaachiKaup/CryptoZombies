pragma solidity >=0.7.0 <0.9.0;

import "./OwnableZombie.sol";

contract ZombieFactory is Ownable {
    uint dnaDigits = 16; //permanently stored, similar to writing to a db
    uint dnaModulus = 10 ** dnaDigits; //exponential like python
    event NewZombie(uint zombieId, string name, uint dna);

//hould be in different file?
    struct Zombie { //complex data type
         uint dna;
        string name;
    }

    Zombie[] public zombies;

//mappings are stores for key value pairs(like hashes)

    mapping (uint => address) zombieToOwner;
    mapping (address => uint) ownerZombieCount;

//scope is a modifier, placed after function name
//_ added to argument variables
// call by value: copy created
//for ref data types (string, arr etc)
// write the memory keyword to pass complex types by value
//passed by ref

//private function anmes start with underscore(naming convention)
    function _createZombie(string memory _name, uint _dna) internal {
        zombies.push(Zombie(_dna, _name));
        zombieToOwner[zombies.length - 1] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(zombies.length - 1, _name, _dna);
    }


// view modifier for when functions are read only
// pure functions are those that dont change any data
    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand  =  uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function generateRandomZombie(string memory _name) public {
        require(ownerZombieCount[msg.sender] == 0);  
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
