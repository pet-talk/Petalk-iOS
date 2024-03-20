import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.PetParentMainTabFeature.rawValue,
    targets: [
        .implements(module: .feature(.PetParentMainTabFeature), dependencies: [
            .feature(target: .BaseFeature),
            .feature(target: .HomeFeature),
            .feature(target: .SearchFeature),
            .feature(target: .ConsultingFeature),
            .feature(target: .MyPageFeature),
        ]),
        .demo(module: .feature(.PetParentMainTabFeature), dependencies: [
            .feature(target: .PetParentMainTabFeature)
        ])
    ]
)
