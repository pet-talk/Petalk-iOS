import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.AuthClient.rawValue,
    targets: [
        .interface(module: .domain(.AuthClient), dependencies: [
            .domain(target: .BaseClient, type: .interface),
            .SPM.KakaoSDK,
            .SPM.NaverThirdPartyLogin,
        ]),
        .implements(module: .domain(.AuthClient), product: .staticLibrary, dependencies: [
            .domain(target: .AuthClient, type: .interface),
        ]),
        .testing(module: .domain(.AuthClient), dependencies: [
            .domain(target: .AuthClient, type: .interface)
        ]),
        .tests(module: .domain(.AuthClient), dependencies: [
            .domain(target: .AuthClient)
        ])
    ]
)
