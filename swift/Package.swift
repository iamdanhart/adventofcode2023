// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode2023",
    targets: [
        .target(
            name: "MyCommon",
            path: "./common",
            sources: ["common.swift"]
        ),
        .executableTarget(
            name: "01",
            dependencies: [
                "MyCommon"
            ],
            path: "./01",
            // sources: ["main.swift"], unneeded since all Swift files in path are included
            resources: [
                .process("input.txt"),
                .process("testinput.txt"),
                .process("testinput2.txt")
            ]
        ),
        .executableTarget(
            name: "02",
            dependencies: [
                "MyCommon"
            ],
            path: "./02",
            resources: [
                .process("input.txt"),
                .process("testinput.txt"),
                .process("testinput2.txt")
            ])
    ]
)
