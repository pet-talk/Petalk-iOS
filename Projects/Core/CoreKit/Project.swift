import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Core.CoreKit.rawValue,
    targets: [
        .interface(module: .core(.CoreKit)),
        .implements(module: .core(.CoreKit), dependencies: [
            .core(target: .CoreKit, type: .interface)
        ]),
        .testing(module: .core(.CoreKit), dependencies: [
            .core(target: .CoreKit, type: .interface)
        ]),
        .tests(module: .core(.CoreKit), dependencies: [
            .core(target: .CoreKit)
        ])
    ]
)
