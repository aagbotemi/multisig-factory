// SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.9;

// contract MultiSig {
//     ///A contract that allows 70% of validSigner to Approve before a withdrawal can be succesful

//     address[] validSigner;
//     uint256 ID = 1;
//     uint256 public Quorum = (validSigner.length * 70) / 100;
//     //maping of trnsaction Id to number of approval to status
//     mapping(uint256 => mapping(uint256 => bool)) _approved;
//     //mapping of transactionId to number of approval
//     mapping(uint256 => uint256) noOfApproval;
//     //checking if an address has approved a particular transactionID
//     mapping(address => mapping(uint256 => bool)) signed;
//     mapping(uint256 => address) beneficiary;
//     mapping(uint256 => uint256) amount;

//     constructor(address[] memory _validSigner) {
//         validSigner = _validSigner;
//     }

//     function withdrawEther(uint256 _amount) external {
//         bool _valid = validOwner();
//         Approve(ID);
//         beneficiary[ID] = msg.sender;
//         amount[ID] = _amount;
//         ID++;
//     }

//     function validOwner() private view returns (bool success) {
//         address valid;

//         for (uint256 i = 0; i < validSigner.length; i++) {
//             if (msg.sender == validSigner[i]) {
//                 valid = msg.sender;
//             }
            
//         }
//         assert(valid != address(0));
//             success = true;
//     }

//     function Approve(uint256 id) public {
//         bool valid = validOwner();
//         uint256 value = amount[id];
//         address _ben = beneficiary[id];
//         assert(signed[msg.sender][id] == false);
//         uint256 num = noOfApproval[id] + 1;
//         if (num >= Quorum) {
//             _approved[id][num] = true;
//             payable(_ben).transfer(value);
//         }
//     }

//     function contractBalance() external view returns(uint){
//         return address(this).balance;
//     }

//     receive() external payable {}

//     fallback() external payable {}
// }
//  ["0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2", "0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db", "0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB"]


// pragma solidity ^0.8.9;

// // Import this file to use console.log
// // import "hardhat/console.sol";

// contract MultiSig {
//     address[] public validSigner;

//     uint ID = 1;

//     // uint public validSigner;
//     // event Withdrawal(uint amount, uint when);

//     uint public Quorum; // to calculate the percentage of people for approval

//     // tx id -> number of approval -> status
//     mapping(uint => mapping(uint => bool)) public _approved;

//     // tx id -> number of approval
//     mapping(uint => uint) public numberOfApproval;

//     // address -> uint -> bool: check if an address have signed a txId already
//     mapping(address => mapping(uint => bool)) public signed;

//     // txId -> address
//     mapping(uint => address) public beneficiary;

//     // txId -> amount
//     mapping(uint => uint) public amount;

//     constructor(address[] memory _validSigner) {
//         validSigner = _validSigner;
//         Quorum = calculateQuorum();
//     }


//     function calculateQuorum() public returns(uint) {
//         Quorum = validSigner.length * 70 / 100;

//         return Quorum;
//         // retun
//     }



//     function withdrawEther(uint _amount) external {
        
//         bool _valid = validOwner();

//         require(_valid, "Not valid owner!");


//         beneficiary[ID] = msg.sender;

//         amount[ID] = _amount;

//         Approve(ID);
//         // balance[msg.sender] += msg.value;

//         ID++;
//     }

//     function validOwner() private view returns(bool success) {
//         address valid;

//         for(uint i = 0; i < validSigner.length; i++) {
//             if(msg.sender == validSigner[i]) {
//                 valid = msg.sender;
//             }
//             assert(valid != address(0));
//             success = true;
//         }
//     }

//     function Approve(uint id) public {
//         // bool valid = validOwner();
//         uint _value = amount[id];
//         address _ben = beneficiary[id];

//         assert(signed[msg.sender][id] == false);

//         signed[msg.sender][id] == true;
        

//         // assert(signed[msg.sender][id]);

//         uint num = numberOfApproval[id] + 1;

//         if(num >= Quorum) {
//             _approved[id][num] = true;

//             payable(_ben).transfer(_value);
//         }
//     }

//     function balanceOfContract() external view returns(uint) {
//         return address(this).balance;
//     }

//     receive() external payable {}

//     fallback() external payable {}

// }


 // "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2", "0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db", "0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB", "0x617F2E2fD72FD9D5503197092aC168c91465E7f2"
 // 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
 // 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
 // 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB
 // 0x617F2E2fD72FD9D5503197092aC168c91465E7f2

//  0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB

pragma solidity ^0.8.9;

contract MultiSig {
///A contract that allows 70% of validSigner to Approve before a withdrawal can be succesful

address[] validSigner;
uint256 ID = 1;
uint256 public Quorum = 3;
//maping of trnsaction Id to number of approval to status
mapping(uint256 => mapping(uint256 => bool)) _approved;
//mapping of transactionId to number of approval
mapping(uint256 => uint256) public noOfApproval;
//checking if an address has approved a particular transactionID
mapping(address => mapping(uint256 => bool)) signed;
mapping(uint256 => address) beneficiary;
mapping(uint256 => uint256) amount;
address owner;

constructor(address[] memory _validSigner) {
    validSigner = _validSigner;
}

function withdrawEther(uint256 _amount) external {
    bool _valid = validOwner();
    require(_valid, "You are not a valid signer");
    beneficiary[ID] = msg.sender;
    amount[ID] = _amount;
    Approve(ID);
    ID++;
}

function validOwner() private view returns (bool success) {
    address valid;

    for (uint256 i = 0; i < validSigner.length; i++) {
        if (msg.sender == validSigner[i]) {
            valid = msg.sender;
        }
    }
    assert(valid != address(0));
    success = true;
}

function Approve(uint256 id) public {
    bool valid = validOwner();
    uint256 value = amount[id];
    address _ben = beneficiary[id];
    assert(signed[msg.sender][id] == false);
    signed[msg.sender][id] = true;
    noOfApproval[id] = noOfApproval[id] + 1;
    if (noOfApproval[id] >= Quorum) {
        _approved[id][noOfApproval[id]] = true;
        payable(_ben).transfer(value);
    }
}

function contractBalance() external view returns (uint256) {
    return address(this).balance;
}

receive() external payable {}

fallback() external payable {}
}