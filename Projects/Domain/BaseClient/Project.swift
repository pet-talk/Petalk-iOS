import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.BaseClient.rawValue,
    targets: [
        .implements(module: .domain(.BaseClient), dependencies: [
            .shared(target: .ThirdParty),
        ]),
        .testing(module: .domain(.BaseClient), dependencies: [
            .domain(target: .BaseClient)
        ]),
        .tests(module: .domain(.BaseClient), dependencies: [
            .domain(target: .BaseClient)
        ])
    ]
)
