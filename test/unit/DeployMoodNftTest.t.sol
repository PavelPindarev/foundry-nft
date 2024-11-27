// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzMDAgMzAwIiB3aWR0aD0iMzAwIiBoZWlnaHQ9IjMwMCI+IDxkZWZzPiA8bGluZWFyR3JhZGllbnQgaWQ9ImdyYWQxIiB4MT0iMCUiIHkxPSIwJSIgeDI9IjEwMCUiIHkyPSIxMDAlIj4gPHN0b3Agb2Zmc2V0PSIwJSIgc3R5bGU9InN0b3AtY29sb3I6cmdiKDI1NSwyNTUsMCk7c3RvcC1vcGFjaXR5OjEiIC8+IDxzdG9wIG9mZnNldD0iMTAwJSIgc3R5bGU9InN0b3AtY29sb3I6cmdiKDI1NSwwLDApO3N0b3Atb3BhY2l0eToxIiAvPiA8L2xpbmVhckdyYWRpZW50PiA8L2RlZnM+IDxyZWN0IHdpZHRoPSIzMDAiIGhlaWdodD0iMzAwIiBmaWxsPSJ1cmwoI2dyYWQxKSIgLz4gPGNpcmNsZSBjeD0iMTUwIiBjeT0iMTUwIiByPSI4MCIgZmlsbD0id2hpdGUiIC8+IDx0ZXh0IHg9IjE1MCIgeT0iMTUwIiBmb250LXNpemU9IjM2IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBkeT0iLjNlbSIgZmlsbD0iYmxhY2siPk5GVDwvdGV4dD4gPC9zdmc+";

        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 300" width="300" height="300"> <defs> <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="100%"> <stop offset="0%" style="stop-color:rgb(255,255,0);stop-opacity:1" /> <stop offset="100%" style="stop-color:rgb(255,0,0);stop-opacity:1" /> </linearGradient> </defs> <rect width="300" height="300" fill="url(#grad1)" /> <circle cx="150" cy="150" r="80" fill="white" /> <text x="150" y="150" font-size="36" text-anchor="middle" dy=".3em" fill="black">NFT</text> </svg>';

        string memory actualSvgUri = deployer.svgToImageUri(svg);

        assertEq(
            keccak256(abi.encodePacked(expectedUri)),
            keccak256(abi.encodePacked(actualSvgUri))
        );
    }
}
