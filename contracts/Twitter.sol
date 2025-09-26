// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30 ;
contract Twitter{
    uint16 public max_length=280;
    struct Tweet{
        uint256 id;
        address author;
        string content;
        uint256 likes;
        uint256 timestamp;
    }
    mapping (address=>Tweet[]) public tweets;
    address public owner;
    //define events here
   
    event TweetCreated(uint256 id,address author , string content ,uint256 timestamp);
    event TweetLiked(address liker ,address tweetAuthor ,uint256 tweetId,uint256 newLikeCount);
    event TweetUnLiked(address liker ,address tweetAuthor ,uint256 tweetId,uint256 newLikeCount);
    constructor(){
         owner=msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender==owner,"U ARE NOT THE OWNER");
        _;
    }
    function changetweetlength(uint16 newtweetlength)public onlyOwner{
        max_length=newtweetlength;
    }
   function createTweet(string memory _tweet) public {
    require(bytes(_tweet).length > 0, "tweet must not be empty"); // FIXED: changed == to >
    require(bytes(_tweet).length <= max_length, "tweet must be less than 280 characters");
    
    Tweet memory newTweet = Tweet({
        id: tweets[msg.sender].length,
        author: msg.sender,
        content: _tweet,
        likes: 0,
        timestamp: block.timestamp
    });
    
    tweets[msg.sender].push(newTweet);
    emit TweetCreated(newTweet.id, newTweet.author, newTweet.content, newTweet.timestamp);
}
    function likeTweet(address author,uint256 id) external{
        require(tweets[author][id].id==id,"TWEET DOESN'T EXISTS");
        tweets[author][id].likes++;
        emit TweetLiked(msg.sender ,author ,id, tweets[author][id].likes);
    }
    function unLikeTweet(address author,uint256 id) external{
        require(tweets[author][id].id==id,"TWEET DOESN'T EXISTS");
        require(tweets[author][id].likes>0,"TWEET DOESN'T HAVE LIKES");
        tweets[author][id].likes--;
        emit TweetUnLiked(msg.sender  ,author ,id, tweets[author][id].likes);
    }
    function getTweet(uint _i) public view returns(Tweet  memory ){
        return tweets[msg.sender][_i];
    }
    function getAllTweet() public view returns(Tweet[] memory){
        return tweets[msg.sender];

       
    }
}