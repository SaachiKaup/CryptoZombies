pragma solidity >=0.7.0 <0.9.0;

import "./Zombiefactory.sol";

contract ZombieFeeding is ZombieFactory {
    function feedAndMultiply(uint _zombieId, uint _targetDna) public {
        require(ownerZombieCount[msg.sender] == 0);
        Zombie storage myZombie = zombies[_zombieId];
    }
}