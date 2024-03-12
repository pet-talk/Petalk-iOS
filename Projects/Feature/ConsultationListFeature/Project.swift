import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.ConsultationListFeature.rawValue,
    targets: [
        .implements(module: .feature(.ConsultationListFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .demo(module: .feature(.ConsultationListFeature), dependencies: [
            .feature(target: .ConsultationListFeature)
        ])
    ]
)
