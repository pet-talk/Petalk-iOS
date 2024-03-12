import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.CustomerReviewFeature.rawValue,
    targets: [
        .implements(module: .feature(.CustomerReviewFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .demo(module: .feature(.CustomerReviewFeature), dependencies: [
            .feature(target: .CustomerReviewFeature)
        ])
    ]
)
