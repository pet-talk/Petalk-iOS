import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Shared.ThirdParty.rawValue,
    targets: [
        .interface(module: .shared(.ThirdParty)),
        .implements(module: .shared(.ThirdParty), dependencies: [
            .shared(target: .ThirdParty, type: .interface)
        ]),
        .testing(module: .shared(.ThirdParty), dependencies: [
            .shared(target: .ThirdParty, type: .interface)
        ]),
        .tests(module: .shared(.ThirdParty), dependencies: [
            .shared(target: .ThirdParty)
        ]),
        .demo(module: .shared(.ThirdParty), dependencies: [
            .shared(target: .ThirdParty)
        ])
    ]
)
