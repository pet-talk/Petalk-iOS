import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.BaseFeature.rawValue,
    targets: [
        .interface(module: .feature(.BaseFeature), dependencies: [
            
        ]),
        .implements(module: .feature(.BaseFeature), dependencies: [
            .shared(target: .ThirdParty),
            .userInterface(target: .DesignSystem),
            
        ])
    ]
)
