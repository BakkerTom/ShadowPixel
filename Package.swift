// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShadowPixel",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "ShadowPixel", targets: ["ShadowPixel"])
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk", .upToNextMajor(from: "11.0.0")),
    ],
    targets: [
        .target(name: "ShadowPixel")
    ]
)
