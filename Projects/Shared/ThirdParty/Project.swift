import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Shared.ThirdParty.rawValue,
    targets: [
        .interface(module: .shared(.ThirdParty), dependencies: [
            
        ]),
        .implements(module: .shared(.ThirdParty), dependencies: [
            .shared(target: .ThirdParty, type: .interface),
            .SPM.KakaoSDK,
            .SPM.NaverThirdPartyLogin
        ]),
        .testing(module: .shared(.ThirdParty), dependencies: [
            .shared(target: .ThirdParty)
        ]),
        .tests(module: .shared(.ThirdParty), dependencies: [
            .shared(target: .ThirdParty)
        ]),
        .demo(module: .shared(.ThirdParty), dependencies: [
            .shared(target: .ThirdParty)
        ])
    ]
)
