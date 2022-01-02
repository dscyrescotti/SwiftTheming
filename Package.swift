// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftTheming",
    platforms: [
        .iOS(.v14),
        .macOS(.v12),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "SwiftTheming",
            targets: ["SwiftTheming"]),
    ],
    dependencies: [
        .package(name: "ViewInspector", url: "https://github.com/nalexn/ViewInspector.git", revision: "0.9.0"),
    ],
    targets: [
        .target(
            name: "SwiftTheming",
            dependencies: []),
        .testTarget(
            name: "SwiftThemingTests",
            dependencies: ["SwiftTheming", "ViewInspector"],
            exclude: ["Assets.xcassets"]),
    ]
)
