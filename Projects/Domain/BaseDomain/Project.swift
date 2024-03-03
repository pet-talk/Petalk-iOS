import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.BaseDomain.rawValue,
    targets: [
        .interface(module: .domain(.BaseDomain), dependencies: [
            .shared(target: .ThirdParty)
        ]),
        .implements(module: .domain(.BaseDomain), dependencies: [
            .core(target: .Network, type: .interface),
        ])
    ]
)
