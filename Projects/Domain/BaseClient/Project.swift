import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.BaseClient.rawValue,
    targets: [
        .interface(module: .domain(.BaseClient), dependencies: [
            .shared(target: .ThirdParty),
        ]),
        .implements(module: .domain(.BaseClient), product: .staticLibrary, dependencies: [
            .domain(target: .BaseClient, type: .interface)
        ]),
        .testing(module: .domain(.BaseClient), dependencies: [
            .domain(target: .BaseClient, type: .interface)
        ]),
        .tests(module: .domain(.BaseClient), dependencies: [
            .domain(target: .BaseClient)
        ])
    ]
)
