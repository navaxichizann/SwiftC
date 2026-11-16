// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "SwiftCs",
    platforms: [
        .iOS(.v26),
        .macOS(.v27)
    ],
    products: [
        .library(
            name: "SwiftCs",
            targets: ["SwiftCs"]
        )
    ],
    targets: [
        .target(
            name: "SwiftCs"
        )
    ]
)
