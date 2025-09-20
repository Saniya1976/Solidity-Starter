// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30 ;

contract Twitter{
    struct Tweet{
        address author;
        string content;
        uint256 likes;
        uint256 timestamp;

    }
    mapping (address=>Tweet[]) public tweets;
    function createTweet (string memory _tweet) public {
        Tweet memory newTweet=Tweet({
            author:msg.sender;
            content:_tweet;
            likes:0;
            timestamp:block.timestamp;
        });
        tweets[msg.sender].push(newTweet);
    }
    function getTweet(address _owner,uint _i) public view returns(string memory ){
        return tweets[_owner][_i];
    }
    function getAllTweet(address _owner) public view returns(string[] memory){
        return tweets[_owner];
    }
}