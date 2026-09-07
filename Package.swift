// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-logic",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Logic", targets: ["Logic"]),
        .library(name: "Logic Standard Library Integration", targets: ["Logic Standard Library Integration"]),
        .library(name: "Logic Foundation Library Integration", targets: ["Logic Foundation Library Integration"]),
        .library(name: "Logic Test Support", targets: ["Logic Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Logic",
            dependencies: [
            ],
            path: "Sources/Logic"
        ),
        .target(
            name: "Logic Standard Library Integration",
            dependencies: [
                .target(name: "Logic"),
            ],
            path: "Sources/Logic Standard Library Integration"
        ),
        .target(
            name: "Logic Foundation Library Integration",
            dependencies: [
                .target(name: "Logic"),
                .target(name: "Logic Standard Library Integration"),
            ],
            path: "Sources/Logic Foundation Library Integration"
        ),
        .target(
            name: "Logic Test Support",
            dependencies: [
                .target(name: "Logic"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Logic Tests",
            dependencies: [
                .target(name: "Logic"),
                .target(name: "Logic Standard Library Integration"),
                .target(name: "Logic Test Support"),
                .target(name: "Logic Foundation Library Integration"),
            ],
            path: "Tests/Logic Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
