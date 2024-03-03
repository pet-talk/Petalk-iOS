import ConfigurationPlugin
import DependencyPlugin
import EnvironmentPlugin
import ProjectDescription

// MARK: - Interface
public extension Target {
    static func interface(module: ModulePaths, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .interface
        }
        .toTarget(with: module.targetName(type: .interface), product: .framework)
    }
    
    static func interface(module: ModulePaths, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .interface, dependencies: dependencies)
            .toTarget(with: module.targetName(type: .interface), product: .framework)
    }
}

// MARK: - Implements
public extension Target {
    static func implements(
        module: ModulePaths,
        product: Product = .staticFramework,
        spec: TargetSpec
    ) -> Target {
        spec.with {
            $0.sources = .sources
        }
        .toTarget(with: module.targetName(type: .sources), product: product)
    }
    
    static func implements(
        module: ModulePaths,
        product: Product = .staticFramework,
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency] = []
    ) -> Target {
        TargetSpec(
            sources: .sources,
            resources: resources,
            dependencies: dependencies
        )
        .toTarget(with: module.targetName(type: .sources), product: product)
    }
}

// MARK: - Testing
public extension Target {
    static func testing(module: ModulePaths, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .testing
        }
        .toTarget(with: module.targetName(type: .testing), product: .framework)
    }
    
    static func testing(module: ModulePaths, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .testing, dependencies: dependencies)
            .toTarget(with: module.targetName(type: .testing), product: .framework)
    }
    
    static func testing(name: String, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .testing
        }
        .toTarget(with: "\(name)Testing", product: .framework)
    }
    
    static func testing(name: String, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .testing, dependencies: dependencies)
            .toTarget(with: "\(name)Testing", product: .framework)
    }
}

// MARK: - Tests
public extension Target {
    static func tests(module: ModulePaths, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .unitTests
        }
        .toTarget(with: module.targetName(type: .unitTest), product: .unitTests)
    }
    
    static func tests(module: ModulePaths, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .unitTests, dependencies: dependencies)
            .toTarget(with: module.targetName(type: .unitTest), product: .unitTests)
    }
}

// MARK: - Demo
public extension Target {
    static func demo(module: ModulePaths, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .demoSources
            $0.settings = .settings(
                base: spec.settings?.base ?? [:],
                configurations: .default,
                defaultSettings: spec.settings?.defaultSettings ?? .recommended
            )
            $0.dependencies = spec.dependencies
            $0.infoPlist = spec.infoPlist ?? .extendingDefault(with: [
                "UILaunchStoryboardName": "LaunchScreen",
                "ENABLE_TESTS": .boolean(true),
            ])
        }
        .toTarget(with: module.targetName(type: .demo), product: .app)
    }
    
    static func demo(module: ModulePaths, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(
            infoPlist: .extendingDefault(with: [
                "UILaunchStoryboardName": "LaunchScreen",
                "ENABLE_TESTS": .boolean(true),
            ]),
            sources: .demoSources,
            dependencies: dependencies
        )
        .toTarget(with: module.targetName(type: .demo), product: .app)
    }
}
