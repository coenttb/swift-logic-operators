// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let logicOperators: Self = "LogicOperators"
    static let logicTesting: Self = "LogicTesting"
}

extension Target.Dependency {
    static let logicOperators: Self = .target(name: .logicOperators)
    static let logicTesting: Self = .target(name: .logicTesting)
}

extension Package {
    static func logicOperators(
        targets: [(name: String, dependencies: [Target.Dependency])]
    ) -> Package {
        Package(
            name: "swift-logic-operators",
            platforms: [
                .macOS(.v10_15),
                .iOS(.v13)
            ],
            products: [
                [
                    .library(
                        name: .logicOperators,
                        targets: [.logicOperators]
                    )
                ],
                [
                    .library(
                        name: .logicTesting,
                        targets: [.logicTesting]
                    )
                ]
            ].flatMap { $0 },
            targets: [
                targets.map { document in
                    Target.target(
                        name: "\(document.name)",
                        dependencies: document.dependencies
                    )
                },
                targets.map { document in
                    Target.testTarget(
                        name: "\(document.name)Tests",
                        dependencies: [
                            Target.Dependency(stringLiteral: document.name),
                            document.name != .logicTesting ? .logicTesting : nil
                        ].compactMap { $0 }
                    )
                }
            ].flatMap { $0 },
            swiftLanguageVersions: [.version("6")]
        )
    }
}

let package = Package.logicOperators(
    targets: [
        (
            name: .logicOperators,
            dependencies: []
        ),
        (
            name: .logicTesting,
            dependencies: []
        )
    ]
)
