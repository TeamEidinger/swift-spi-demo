// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "swift-spi-demo",
    products: [
        .library(
            name: "swift-spi-demo",
            targets: ["Shopping"]
        ),
    ],
    dependencies: [.package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMinor(from: "1.0.0"))],
    targets: [
        .target(
            name: "Shopping",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")],
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"]),
//                .unsafeFlags(["-Xfrontend", "-experimental-spi-only-imports"]) // requires Swift 5.8
            ]
        ),
        .testTarget(
            name: "ShoppingTests",
            dependencies: ["Shopping"]
        ),
    ]
)
