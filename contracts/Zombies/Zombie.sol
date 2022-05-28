pragma solidity >=0.5.0 <0.6.0;

struct Zombie { //complex data type
    uint dna;
    string name;
}

//dynamic array of struct
Zombie[] public zombies;