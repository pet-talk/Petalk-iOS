import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Shared.ThirdParty.rawValue,
    targets: [
        .implements(
            module: .shared(.ThirdParty),
            product: .framework,
            dependencies: [
                .SPM.ComposableArchitecture,
                .shared(target: .FoundationUtility),
                .shared(target: .CombineUtility),
                .shared(target: .SwiftUIUtility),
                .shared(target: .Logger)
            ]
        )
    ]
)
