// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyHTTP",
    platforms: [.iOS(.v13), .macOS(.v13)],
    products: [
        .library(
            name: "SwiftyHTTP",
            targets: ["SwiftyHTTP"]),
    ],
    targets: [
        .target(
            name: "SwiftyHTTP",
            dependencies: [
            ]),
        .testTarget(
            name: "SwiftyHTTPTests",
            dependencies: [
                "SwiftyHTTP"
            ]),
    ]
)
