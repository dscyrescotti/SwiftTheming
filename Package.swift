// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

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
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0-swift-5.9-DEVELOPMENT-SNAPSHOT-2023-04-25-b"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.5")
    ],
    targets: [
        .macro(
            name: "SwiftThemingMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(
            name: "SwiftTheming",
            dependencies: [
                "SwiftThemingMacros",
                .product(name: "Yams", package: "Yams")
            ]
        )
//        .testTarget(
//            name: "SwiftThemingTests",
//            dependencies: ["SwiftTheming", "ViewInspector"],
//            exclude: ["Assets.xcassets"]
//        )
    ],
    swiftLanguageVersions: [.v5]
)
