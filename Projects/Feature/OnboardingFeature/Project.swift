import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.OnboardingFeature.rawValue,
    targets: [
        .interface(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .BaseFeature, type: .interface)
        ]),
        .implements(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature, type: .interface),
            .feature(target: .BaseFeature),
            .domain(target: .AuthDomain),
        ]),
        .testing(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature, type: .interface)
        ]),
        .tests(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature, type: .testing)
        ]),
        .demo(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature)
        ])
    ]
)
