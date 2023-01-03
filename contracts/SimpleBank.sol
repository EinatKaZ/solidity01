// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
 
contract SimpleBank {
    function addFunds() external payable{
        funders.push(msg.sender);
    }

    function sumFunds() external payable{
        sum.push(msg.value);
    }


    address[] public funders;
    address[] public sum ;
}


// const instance = await SimpleBank.deployed()
//instance.addFunds({value:"500000000000000000" , from: accounts[0]})
//instance.addFunds({value:"500000000000000000" , from: accounts[1]})
// const funds = instance.funds()