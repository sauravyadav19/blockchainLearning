// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.28;

contract ParentHouse{

    string private vault = "Money";
    string private privateSpace = "Bedroom";
    string internal sharedSpace = "Living room, Lounge, Kitchen";
    string public doorbell = "Doorbell";

    function usePrivateSpace() private view returns(string memory){
        return privateSpace;
    }

    function useSharedSpace () internal view returns(string memory){
        return sharedSpace;
    }

    function showVaultContent() public view returns(string memory){
        return vault;
    }
    function ringDoorbell() external view returns(string memory){
        return doorbell;
    }
}
