import ProjectDescription
import ConfigurationPlugin
import DependencyPlugin

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        Package.SPM.allCases.map(\.package),
        baseSettings: .settings(
            configurations: [
                .debug(name: .dev),
                .debug(name: .stage),
                .release(name: .prod)
            ]
        )
    ),
    platforms: [.iOS]
)
