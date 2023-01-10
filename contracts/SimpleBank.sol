// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
 
contract SimpleBank {
//    address[] public funders; All the comments ones are for the sum
//    uint[] public funds;
    uint public numberOfFunders ;
    mapping(address => bool) private funders;
    mapping(uint => address) private lutFunders; 
    mapping(address => uint ) private sumFunds ; 

    address public owner ;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner , "Only the owner can do that");
        _;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        owner = newOwner ; 
    }

    function sumF() external payable{
        address[] memory _sumFunds = new address[](sumFunds);
        for(uint j = 0 ; j < numberOfFunders ; j++){
            _sumFunds[j] = sumFunds[j] + _sumFunds[j];
            
        }
    }

    function addFunds() external payable{
//        funders.push(msg.sender);
//        funds.push(msg.value);
         address funder = msg.sender ;
         if(!funders[funder]){
            uint index = numberOfFunders++ ;
            funders[funder] = true ; 
            lutFunders[index] = funder ; 
         }
    }

    function getAllFunders() external view returns(address[] memory) {
        address[] memory _funders = new address[](numberOfFunders);
        for(uint i = 0 ; i < numberOfFunders ; i++){
            _funders[i] = lutFunders[i];
        }
        return _funders;
    }

    function withdraw(uint withdrawAmount) external {
        require(withdrawAmount < 1000000000000000000 || msg.sender == owner, "You can't withdraw more than 1 ether");
        payable (msg.sender).transfer(withdrawAmount) ;
    }

}


// const instance = await SimpleBank.deployed()
//instance.addFunds({value:"500000000000000000" , from: accounts[0]})
//instance.addFunds({value:"500000000000000000" , from: accounts[1]})
// const funds = instance.funds()
// instance.getAllFunders()
// instance.withdraw("1000000000000000000" ,{from: accounts[1]} )
// intance.transferOwnership("0x0278ee9dC6f70163A249D0f99D894b9bf65A037c")