import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.VetMainTabFeature.rawValue,
    targets: [
        .implements(module: .feature(.VetMainTabFeature), dependencies: [
            .feature(target: .BaseFeature),
            .feature(target: .HomeFeature),
            .feature(target: .CustomerReviewFeature),
            .feature(target: .ConsultationListFeature),
            .feature(target: .MyPageFeature),
        ]),
        .demo(module: .feature(.VetMainTabFeature), dependencies: [
            .feature(target: .VetMainTabFeature)
        ])
    ]
)
