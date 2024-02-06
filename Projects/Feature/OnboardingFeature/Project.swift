import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.OnboardingFeature.rawValue,
    targets: [
        .interface(module: .feature(.OnboardingFeature)),
        .implements(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature, type: .interface),
            .feature(target: .BaseFeature, type: .interface)
        ]),
        .testing(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature, type: .interface)
        ]),
        .tests(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature)
        ]),
        .demo(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature)
        ])
    ]
)
