// swift-tools-version:4.0

import PackageDescription

var package = Package(
    name: "TitanRouter",
    products: [
        .library(name: "TitanRouter", targets: ["TitanRouter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bermudadigitalstudio/TitanCore.git", .upToNextMinor(from: "0.3.0"))
    ],
    targets: [
        .target(name: "TitanRouter", dependencies: ["TitanCore"]),
        .testTarget(name: "TitanRouterTests", dependencies: ["TitanRouter"])
    ]
)
