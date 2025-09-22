// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30 ;

contract test{
    address public owner;

constructor(){
    owner=msg.sender;
}
modifier onlyowner(){
    require(msg.sender==owner,"u are not the owner");
    _;
}
function changeOwner(address newOwner) public onlyowner{
    owner=newOwner;
}
}