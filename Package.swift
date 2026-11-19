// swift-tools-version: 6.2
import PackageDescription
import Foundation

func findExcludedFiles(in targetPath: String) -> [String] {
    let fileManager = FileManager.default
    let baseURL = URL(fileURLWithPath: #filePath)
        .deletingLastPathComponent()
        .appendingPathComponent(targetPath)
    
    guard let enumerator = fileManager.enumerator(at: baseURL, includingPropertiesForKeys: nil) else {
        return []
    }
    
    var excluded: [String] = []
    for case let fileURL as URL in enumerator {
        let name = fileURL.lastPathComponent
        if name.hasSuffix(".md") || name.contains("_htu") {
            let relativePath = fileURL.path.replacingOccurrences(of: baseURL.path + "/", with: "")
            excluded.append(relativePath)
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
            name: "SwiftCs"
            exclude: findExcludedFiles(in: "Sources/SwiftCs")
            )
        )
    ]
)
