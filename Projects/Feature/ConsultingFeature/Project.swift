import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.ConsultingFeature.rawValue,
    targets: [
        .implements(module: .feature(.ConsultingFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .demo(module: .feature(.ConsultingFeature), dependencies: [
            .feature(target: .ConsultingFeature)
        ])
    ]
)
