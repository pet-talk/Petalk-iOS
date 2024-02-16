import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.AuthClient.rawValue,
    targets: [
        .implements(module: .domain(.AuthClient), product: .staticLibrary, dependencies: [
            .domain(target: .BaseClient),
            .SPM.KakaoSDK,
            .SPM.NaverThirdPartyLogin,
        ]),
        .testing(module: .domain(.AuthClient), dependencies: [
            .domain(target: .AuthClient)
        ]),
        .tests(module: .domain(.AuthClient), dependencies: [
            .domain(target: .AuthClient)
        ])
    ]
)
