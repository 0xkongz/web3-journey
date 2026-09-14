// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12; // ^ should mean that the latest stable version of the compiler will be used

contract SimpleStorage{

    uint256 favoriteNumber;

    // create a struct (matrix) to store multiple variables in one variable
    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    
    // initialize an array of Person struck (empty initially) to store multiple people
    Person [] public listOfPeople;
    
    // mapping statement. important for storing key-value pairs. In this case, the key is a string (name) and the value is a uint256 (favorite number)
    mapping(string => uint256) public nameToFavoriteNumber;

    // function to store a favorite number
    function store (uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // read function to retrieve the favorite number
    function retrieve () public view returns (uint256){
        return favoriteNumber;
    }

    // function to add a person to the list of people and update the mapping
    function addPerson (string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber; // needed to update the mapping with the new person's favorite number
    }
}

// Mapping is added here so we don't need to loop through the list of people to find a person's favorite number. Instead, we can just use the mapping to get the favorite number directly using the person's name as the key.
// key must be unique to a certain value. If two people have the same name, the mapping will only store the last person's favorite number.
// However since the function addPerson adds the pair to array and mapping, it will result in a desync because the mapping will only store the last person's favorite number, while the array will have all the people added. This can lead to inconsistencies if we try to retrieve a person's favorite number using the mapping after adding multiple people with the same name.