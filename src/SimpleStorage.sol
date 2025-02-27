// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./Fundme.sol";

contract SimpleStorage is Fundme {
    uint256 public favoriteNumber;

    struct Person {
        string name;
        uint256 age;
        string[] hobby;
    }

    Person[] public person; //  = Person('1',10,new string[](0));

    function store(uint256 _number) public virtual {
        favoriteNumber = _number;
        retrieve();
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _age) public {
        Person storage p = person.push(); // 添加一个新的 Person 对象
        p.name = _name;
        p.age = _age;
        p.hobby.push("1");
        p.hobby.push("22");
    }

    function updatePerson(
        uint256 index,
        string memory _name,
        uint256 _age
    ) public {
        person[index].name = _name;
        person[index].age = _age;
    }
}
