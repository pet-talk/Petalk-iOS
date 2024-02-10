import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.AuthDomain.rawValue,
    targets: [
        .interface(module: .domain(.AuthDomain)),
        .implements(module: .domain(.AuthDomain), product: .staticFramework, dependencies: [
            .domain(target: .AuthDomain, type: .interface),
            .domain(target: .BaseDomain, type: .interface),
        ]),
        .testing(module: .domain(.AuthDomain), dependencies: [
            .domain(target: .AuthDomain, type: .interface)
        ]),
        .tests(module: .domain(.AuthDomain), dependencies: [
            .domain(target: .AuthDomain)
        ])
    ]
)
