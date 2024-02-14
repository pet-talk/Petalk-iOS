import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Core.Logger.rawValue,
    targets: [
        .interface(module: .core(.Logger)),
        .implements(module: .core(.Logger), dependencies: [
            .core(target: .Logger, type: .interface)
        ])
    ]
)
