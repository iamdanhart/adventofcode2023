// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode2023",
    // products: [
    //     // Products define the executables and libraries a package produces, and make them visible to other packages.
    //     .library(
    //         name: "MyCommon",
    //         targets: ["MyCommon"])
    // ],
    targets: [
        .target(
            name: "MyCommon",
            path: "./common",
            sources: ["common.swift"]
        ),
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "01",
            dependencies: [
                "MyCommon"
            ],
            path: "./01",
            sources: ["main.swift"],
            resources: [
                .process("input.txt")
            ])
    ]
)
