// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30 ;

contract pausabletoken{
    address public owner;
    bool public paused;
    mapping(address => uint256) public balances;
constructor(){
    owner=msg.sender;
    paused=false;
    balances[owner]=1000;
}
modifier onlyOwner(){
    require(msg.sender==owner,"u are not the owner");
    _;
}
modifier notPaused(){
    require(paused==false,"the contract is paused");
    _;
}
function pause() public onlyOwner{
    paused=true;
}
function unpause() public onlyOwner{
    paused=false;
}
function transfer(address to,uint amount) public{
    require(balances[msg.sender]>=amount,"insufficient balance");
    balances[msg.sender]-=amount;
    balances[to]+=amount;
}
}