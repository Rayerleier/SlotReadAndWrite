pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {MyWallet} from "../src/MyWallet.sol";

contract TestMyWallet is Test{

    address alice = makeAddr("alice");
    address bob = makeAddr("bob");
    MyWallet wallet;
    function setUP()public {
    }

    function test_all()public {
        vm.startPrank(alice);
        wallet = new MyWallet("rain");
        assertEq(wallet.getOwner(), alice);
        wallet.transferOwernship(bob);
        assertEq(wallet.getOwner(), bob);
    }
}