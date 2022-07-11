// SPDX-License-Identifier: SimPL-3.0
pragma solidity ^0.8.0;

contract SolidityTest{
    function helloWorld() public pure returns(string memory) {
        return "Hello World";
    }


    uint a =1;
    uint b =2;
    function helloWorld12() public view  returns(uint) {

        uint result=a+b;
    
        return result;
    }

    function test19() private  view returns(uint){

        uint result=a+b;
        return result;
    }

     function test25() external view returns(uint){

        uint result=a+b;
        return result;
    }

    function test31() internal view returns(uint){

        uint result=a+b;
        return result;
    }

    function minusPayable() external payable returns(uint256 balance) {
        minus();    
        balance = address(this).balance;
    }
    uint256 public _number = 5;
    function minus() internal {
        _number = _number - 1;
    }

    function test46(string calldata name) public  returns(uint256 balance,string calldata ) {
        balance = address(this).balance;
       
        return (balance,name);
    }

    function test52() public   returns(uint) {
      
        uint name =  12;
        return name;
    }

    function test58() public   returns(string memory name) {
      
        string  memory name = "a";
        
    }


    function global() external view returns(address, uint, bytes memory, uint ){
        address sender = msg.sender;
        uint blockNum = block.number;
        bytes memory data = msg.data;
        uint  price = tx.gasprice;
        return(sender, blockNum, data, price);
    }

    event log(string);
    event log(uint);


}

