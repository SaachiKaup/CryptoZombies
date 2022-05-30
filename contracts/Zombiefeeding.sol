pragma solidity >=0.7.0 <0.9.0;

import "./Zombiefactory.sol";

contract ZombieFeeding is ZombieFactory {
    function feedAndMultiply(uint _zombieId, uint _targetDna) public {
        require(ownerZombieCount[msg.sender] == 0); //should be the same thing
        Zombie storage myZombie = zombies[_zombieId];
        _targetDna = _targetDna % dnaModulus; //it's a variable copy
        uint newDna = (_targetDna + myZombie.dna) / 2;
        createZombie("NoName", newDna);
    }
}