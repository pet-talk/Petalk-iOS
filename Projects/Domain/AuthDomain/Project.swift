import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.AuthDomain.rawValue,
    targets: [
        .implements(module: .domain(.AuthDomain), product: .framework, dependencies: [
            .domain(target: .BaseDomain),
            .SPM.KakaoSDK,
            .SPM.NaverThirdPartyLogin,
        ]),
        .testing(module: .domain(.AuthDomain), dependencies: [
            .domain(target: .AuthDomain)
        ]),
        .tests(module: .domain(.AuthDomain), dependencies: [
            .domain(target: .AuthDomain)
        ])
    ]
)
