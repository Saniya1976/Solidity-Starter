// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30 ;

contract eventExample{
    event newUserRegistered(address indexed user, string username);
    struct User{
        uint256 age;
        string username;
    }
    mapping(address=>User) public users;
    function registerUser(string memory _username , uint256 _age) public {
        User storage newUser= users[msg.sender];
        newUser.username=_username;
        newUser.age=_age;
        emit newUserRegistered(msg.sender ,_username);
    }
}