// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// Solidity contracts corresponding to the Python class examples from https://en.wikipedia.org/wiki/C3_linearization

contract O {
    
    function getValue() virtual public pure returns (string memory) {
        return "O";
    }
}

contract A is O {
    
    function getValue() virtual override public pure returns (string memory) {
        return string(abi.encodePacked("A -> ", super.getValue()));
    }
}

contract B is O {
    
    function getValue() virtual override public pure returns (string memory) {
        return string(abi.encodePacked("B -> ", super.getValue()));
    }
}

contract C is O {
    
    function getValue() virtual override public pure returns (string memory) {
        return string(abi.encodePacked("C -> ", super.getValue()));
    }
}

contract DD is O {
    
    function getValue() virtual override public pure returns (string memory) {
        return string(abi.encodePacked("D -> ", super.getValue()));
    }
}

contract E is O {
    
    function getValue() virtual override public pure returns (string memory) {
        return string(abi.encodePacked("E -> ", super.getValue()));
    }
}

contract K1 is A, B, C {
    
    function getValue() virtual override(A, B, C) public pure returns (string memory) {
        return string(abi.encodePacked("K1 -> ", super.getValue()));
    }
}

contract K3 is DD, A {
    
    function getValue() virtual override(DD, A) public pure returns (string memory) {
        return string(abi.encodePacked("K3 -> ", super.getValue()));
    }
}

contract K2 is E, DD, B {
    
    function getValue() virtual override(E, DD, B) public pure returns (string memory) {
        return string(abi.encodePacked("K2 -> ", super.getValue()));
    }
}

contract Z is K2, K3, K1 {
    
    function getValue() override(K2, K3, K1) public pure returns (string memory) {
        return string(abi.encodePacked("Z -> ", super.getValue()));
    }
}
