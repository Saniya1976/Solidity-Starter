// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30 ;
contract Twitter{
    uint16 max_length=280;
    struct Tweet{
        address author;
        string content;
        uint256 likes;
        uint256 timestamp;
    }
    mapping (address=>Tweet[]) public tweets;
    function createTweet (string memory _tweet) public {
        require(byte(_tweet).length==0,"tweet must not be empty")
        require(byte(_tweet).length<=max_length,"tweet must be less than 280 characters")
        Tweet memory newTweet=Tweet({
            author:msg.sender,
            content:_tweet,
            likes:0,
            timestamp:block.timestamp
        });
        tweets[msg.sender].push(newTweet);
    }
    function getTweet(uint _i) public view returns(Tweet  memory ){
        return tweets[msg.sender][_i];
    }
    function getAllTweet() public view returns(Tweet[] memory){
        return tweets[msg.sender];
    }
}