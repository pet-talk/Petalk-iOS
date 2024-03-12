import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.OnboardingFeature.rawValue,
    targets: [
        .implements(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .BaseFeature),
            .domain(target: .AuthDomain),
        ]),
        .testing(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature)
        ]),
        .tests(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature, type: .testing)
        ]),
        .demo(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature)
        ])
    ]
)
