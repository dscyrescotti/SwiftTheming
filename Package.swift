// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftTheming",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "SwiftTheming",
            targets: ["SwiftTheming"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/nalexn/ViewInspector.git", revision: "0.9.0"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "508.0.0")
    ],
    targets: [
        .target(
            name: "SwiftTheming",
            dependencies: []
        ),
//        .testTarget(
//            name: "SwiftThemingTests",
//            dependencies: ["SwiftTheming", "ViewInspector"],
//            exclude: ["Assets.xcassets"]
//        )
    ],
    swiftLanguageVersions: [.v5]
)
