// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "swift-composable-haptics",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "ComposableHaptics", targets: ["ComposableHaptics"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-case-paths",
            from: Version(1, 3, 0)
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-dependencies",
            from: Version(1, 2, 0)
        )
    ],
    targets: [
        .target(name: "ComposableHaptics", dependencies: [
            .product(name: "CasePaths", package: "swift-case-paths"),
            .product(name: "Dependencies", package: "swift-dependencies"),
            .product(name: "DependenciesMacros", package: "swift-dependencies")
        ])
    ]
)
