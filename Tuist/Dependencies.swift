import ProjectDescription
import ConfigurationPlugin
import DependencyPlugin

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        Package.SPM.allCases.map(\.package),
        productTypes: [
            "Dependencies": .framework,
            "CombineSchedulers": .framework,
            "ConcurrencyExtras": .framework,
            "XCTestDynamicOverlay": .framework,
//            "TCACoordinators": .framework,
        ],
        baseSettings: .settings(
            configurations: .default
        )
    ),
    platforms: [.iOS]
)
