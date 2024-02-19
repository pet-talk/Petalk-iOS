import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.RootFeature.rawValue,
    targets: [
        .implements(module: .feature(.RootFeature), dependencies: [
            .feature(target: .OnboardingFeature),
            .feature(target: .MainTabFeature),
            .core(target: .Network, type: .interface),
        ]),
        .demo(module: .feature(.RootFeature), dependencies: [
            .feature(target: .RootFeature)
        ])
    ]
)
