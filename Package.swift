// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "SwiftStringObfuscator",
    products: [
        .executable(name: "swift_string_obfuscator", targets: ["swift_string_obfuscator"]),
    ],
    dependencies: [
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .exact("0.50600.1")),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
    ],
    //
    targets: [
        .plugin(
            name: "SwiftStringObfuscatorPlugin",
            capability: .buildTool(),
            dependencies: ["swift_string_obfuscator_executables"]
        ),
        
        /// Binary target that provides the built SwiftGen executables.
        .binaryTarget(
            name: "swift_string_obfuscator_executables",
            url: "https://github.com/CodeEagle/Swift-String-Obfuscator/releases/download/1.0.0/swift_string_obfuscator_executables.zip",
            checksum: "d419f63cc5cbdac721a8470d4f37ba4b9618d9bdab0812292eb77f7a230fb957"
        ),
        .target(
            name: "swift_string_obfuscator",
            dependencies: [
                "SwiftStringObfuscatorCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .target(
            name: "SwiftStringObfuscatorCore",
            dependencies: [.product(name: "SwiftSyntaxParser", package: "SwiftSyntax")]
        ),
        .testTarget(
            name: "SwiftStringObfuscatorTests",
            dependencies: ["SwiftStringObfuscatorCore"]),
    ]
)
