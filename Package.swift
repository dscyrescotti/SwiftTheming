// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftTheming",
    products: [
        .library(
            name: "SwiftTheming",
            targets: ["SwiftTheming"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftTheming",
            dependencies: []),
        .testTarget(
            name: "SwiftThemingTests",
            dependencies: ["SwiftTheming"]),
    ]
)
