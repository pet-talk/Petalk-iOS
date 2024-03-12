import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.MyPageFeature.rawValue,
    targets: [
        .implements(module: .feature(.MyPageFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .demo(module: .feature(.MyPageFeature), dependencies: [
            .feature(target: .MyPageFeature)
        ])
    ]
)
