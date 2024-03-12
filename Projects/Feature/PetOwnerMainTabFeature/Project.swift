import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.PetOwnerMainTabFeature.rawValue,
    targets: [
        .implements(module: .feature(.PetOwnerMainTabFeature), dependencies: [
            .feature(target: .BaseFeature),
            .feature(target: .HomeFeature),
            .feature(target: .SearchFeature),
            .feature(target: .ConsultingFeature),
            .feature(target: .MyPageFeature),
        ]),
        .demo(module: .feature(.PetOwnerMainTabFeature), dependencies: [
            .feature(target: .PetOwnerMainTabFeature)
        ])
    ]
)
