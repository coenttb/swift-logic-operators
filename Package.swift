// swift-tools-version:5.10.1
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

extension Target.Dependency {

}

extension [Target.Dependency] {
    static let shared: Self = [
    ]
}

extension Package {
    static func logicOperators(
        targets: [(
            name: String,
            dependencies: [Target.Dependency]
        )]
    ) -> Package {

        let names = targets.map(\.name)

        return Package(
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
                ],
            ].flatMap { $0 },
            targets: [
                targets.map { document in
                    Target.target(
                        name: "\(document.name)",
                        dependencies: .shared + [] + document.dependencies
                    )
                },
                targets.map { document in
                    Target.testTarget(
                        name: "\(document.name)Tests",
                        dependencies: [.init(stringLiteral: document.name), .logicTesting]
                    )
                }
            ].flatMap { $0 }
        )
    }
}

let package = Package.logicOperators(
    targets: [
        (
            name: .logicOperators,
            dependencies: [
                
            ]
        ),
        (
            name: .logicTesting,
            dependencies: [

            ]
        ),
    ]
)
