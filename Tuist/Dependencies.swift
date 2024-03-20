import ProjectDescription
import ConfigurationPlugin
import DependencyPlugin

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        Package.SPM.allCases.map(\.package),
        productTypes: [
            "Dependencies": .framework,
            "CombineSchedulers": .framework, // TCA
            "ConcurrencyExtras": .framework, // TCA
            "XCTestDynamicOverlay": .framework, // TCA
            "Alamofire": .framework, // Alamofire, KakaoSDK
        ],
        baseSettings: .settings(
            configurations: .default
        )
    ),
    platforms: [.iOS]
)
