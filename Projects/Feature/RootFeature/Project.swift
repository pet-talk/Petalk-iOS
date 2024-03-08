import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.RootFeature.rawValue,
    targets: [
        .interface(module: .feature(.RootFeature), dependencies: [
            .feature(target: .BaseFeature, type: .interface)
        ]),
        .implements(module: .feature(.RootFeature), dependencies: [
            .feature(target: .RootFeature, type: .interface),
            .feature(target: .BaseFeature),
            .feature(target: .OnboardingFeature),
            .feature(target: .MainTabFeature),
            .core(target: .Networking),
        ]),
        .demo(module: .feature(.RootFeature), dependencies: [
            .feature(target: .RootFeature)
        ])
    ]
)
