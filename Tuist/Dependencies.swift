import ProjectDescription
import ConfigurationPlugin
import DependencyPlugin

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        Package.SPM.allCases.map(\.package),
        productTypes: [
            "Dependencies": .framework, // TCA, TCACoordinators
            "CombineSchedulers": .framework, // TCA, TCACoordinators
            "ConcurrencyExtras": .framework, // TCA, TCACoordinators
            "XCTestDynamicOverlay": .framework, // TCA, TCACoordinators
            "Alamofire": .framework, // Alamofire, KakaoSDK
//            "TCACoordinators": .framework,
        ],
        baseSettings: .settings(
            configurations: .default
        )
    ),
    platforms: [.iOS]
)
