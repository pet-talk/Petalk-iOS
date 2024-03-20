import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.SplashFeature.rawValue,
    targets: [
        .implements(
            module: .feature(.SplashFeature),
            spec: .init(
                resources: ["Resources/**"],
                dependencies: [
                .feature(target: .BaseFeature)
            ])
         ),
        .demo(module: .feature(.SplashFeature), dependencies: [
            .feature(target: .SplashFeature)
        ])
    ]
)
