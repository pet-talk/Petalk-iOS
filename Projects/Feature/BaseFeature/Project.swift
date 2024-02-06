import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.BaseFeature.rawValue,
    targets: [
        .interface(module: .feature(.BaseFeature), dependencies: [
            .SPM.ComposableArchitecture,
        ]),
        .implements(
            module: .feature(.BaseFeature),
            product: .framework,
            dependencies: [
                .feature(target: .BaseFeature, type: .interface),
                .userInterface(target: .DesignSystem, type: .interface),
                .core(target: .CoreKit),
            ]
        )
    ]
)
