// swift-tools-version: 6.2
import PackageDescription
import Foundation

func findExcludedFiles(in targetPath: String) -> [String] {
    let fileManager = FileManager.default
    let baseURL = URL(fileURLWithPath: #filePath)
        .deletingLastPathComponent()
        .appendingPathComponent(targetPath)
        .resolvingSymlinksInPath()
    
    guard let enumerator = fileManager.enumerator(at: baseURL, includingPropertiesForKeys: nil) else {
        return []
    }
    
    let prefix = baseURL.path + "/"
    var excluded: [String] = []
    
    for case let fileURL as URL in enumerator {
        let name = fileURL.lastPathComponent
        if name.hasSuffix(".md") || name.contains("_htu") {
            let resolvedPath = fileURL.resolvingSymlinksInPath().path
            if resolvedPath.hasPrefix(prefix) {
                excluded.append(String(resolvedPath.dropFirst(prefix.count)))
            }
        }
    }
    return excluded
}

let package = Package(
    name: "SwiftCs",
    platforms: [
        .iOS(.v26),
        .macOS(.v26)
    ],
    products: [
        .library(
            name: "SwiftCs",
            targets: ["SwiftCs"]
        )
    ],
    targets: [
        .target(
            name: "SwiftCs",
            exclude: findExcludedFiles(in: "Sources/SwiftCs")
        )
    ]
)
