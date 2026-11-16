import PackageDescription

let package = Package(
    name: "SwiftCs",
    platforms: [
        .iOS(.v26),
        .macOS(.v27)
    ],
    products: [
        .library(
            name: "SwiftCToggle",
            targets: ["SwiftCs"]
        )
    ],
    targets: [
        .target(
            name: "SwiftCs"
        )
    ]
)
