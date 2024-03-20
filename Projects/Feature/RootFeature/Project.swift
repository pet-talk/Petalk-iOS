import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.RootFeature.rawValue,
    targets: [
        .implements(module: .feature(.RootFeature), dependencies: [
            .feature(target: .BaseFeature),
            .feature(target: .SplashFeature),
            .feature(target: .OnboardingFeature),
            .feature(target: .PetParentMainTabFeature),
            .feature(target: .VetMainTabFeature),
        ]),
        .demo(module: .feature(.RootFeature), dependencies: [
            .feature(target: .RootFeature)
        ])
    ]
)
