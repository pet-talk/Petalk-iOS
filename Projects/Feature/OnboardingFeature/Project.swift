import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.OnboardingFeature.rawValue,
    targets: [
        .implements(module: .feature(.OnboardingFeature), dependencies: [
            .SPM.KakaoSDK,
            .SPM.NaverThirdPartyLogin,
            .feature(target: .BaseFeature),
            .domain(target: .AuthClient, type: .interface)
        ]),
        .testing(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature)
        ]),
        .tests(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature)
        ]),
        .demo(module: .feature(.OnboardingFeature), dependencies: [
            .feature(target: .OnboardingFeature)
        ])
    ]
)
