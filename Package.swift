// swift-tools-version:5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let logicOperators: Self = "LogicOperators"
}

extension Target.Dependency {
    static let logicOperators: Self = .target(name: .logicOperators)
}

extension Target.Dependency {

}

extension [Target.Dependency] {
    static let shared: Self = [
    ]
}

extension Package {
    static func language(
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
                        name: "LogicOperators",
                        targets: ["LogicOperators"]
                    )
                ],
            ].flatMap { $0 },
            dependencies: [
                .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.1.5")
            ],
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
                        dependencies: [.init(stringLiteral: document.name)]
                    )
                }
            ].flatMap { $0 }
        )
    }
}

let package = Package.language(
    targets: [
        (
            name: .logicOperators,
            dependencies: [

            ]
        )
    ]
)
