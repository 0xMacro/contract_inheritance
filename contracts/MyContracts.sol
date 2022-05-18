// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract A {
    
    function getValue() virtual public pure returns (string memory) {
        return "A";
    }
}

contract B is A{
    
    function getValue() virtual override public pure returns (string memory) {
        return string(abi.encodePacked("B -> ", super.getValue()));
    }
}

contract C {
   
   function getValue() virtual public pure returns (string memory) {
       return "C";
   }
}

contract D is C, B {
    
    function getValue() override(B, C) public pure returns (string memory) {
        return string(abi.encodePacked("D -> ", super.getValue()));
    }
}

contract E is B, C {
    
    function getValue() override(B, C) public pure returns (string memory) {
        return string(abi.encodePacked("E -> ", super.getValue()));
    }
}
