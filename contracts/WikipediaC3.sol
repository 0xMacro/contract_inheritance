// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract O {
    
    function getValue() virtual public pure returns (string memory) {
        return "O";
    }
}

contract AA is O {
    
    function getValue() virtual override public pure returns (string memory) {
        return string(abi.encodePacked("A -> ", super.getValue()));
    }
}

contract BB is O {
    
    function getValue() virtual override public pure returns (string memory) {
        return string(abi.encodePacked("B -> ", super.getValue()));
    }
}

contract CC is O {
    
    function getValue() virtual override public pure returns (string memory) {
        return string(abi.encodePacked("C -> ", super.getValue()));
    }
}

contract DD is O {
    
    function getValue() virtual override public pure returns (string memory) {
        return string(abi.encodePacked("D -> ", super.getValue()));
    }
}

contract EE is O {
    
    function getValue() virtual override public pure returns (string memory) {
        return string(abi.encodePacked("E -> ", super.getValue()));
    }
}

contract K1 is AA, BB, CC {
    
    function getValue() virtual override(AA, BB, CC) public pure returns (string memory) {
        return string(abi.encodePacked("K1 -> ", super.getValue()));
    }
}

contract K3 is DD, AA {
    
    function getValue() virtual override(DD, AA) public pure returns (string memory) {
        return string(abi.encodePacked("K3 -> ", super.getValue()));
    }
}

contract K2 is EE, DD, BB {
    
    function getValue() virtual override(EE, DD, BB) public pure returns (string memory) {
        return string(abi.encodePacked("K2 -> ", super.getValue()));
    }
}

contract Z is K2, K3, K1 {
    
    function getValue() override(K2, K3, K1) public pure returns (string memory) {
        return string(abi.encodePacked("Z -> ", super.getValue()));
    }
}
