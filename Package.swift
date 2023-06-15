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
    dependencies: [
        .package(url: "https://github.com/antonio-war/SwiftyCache", from: .init(0, 2, 0))
    ],
    targets: [
        .target(
            name: "SwiftyHTTP",
            dependencies: [
                "SwiftyCache"
            ]),
        .testTarget(
            name: "SwiftyHTTPTests",
            dependencies: ["SwiftyHTTP"]),
    ]
)
