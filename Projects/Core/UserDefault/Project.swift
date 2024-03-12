import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Core.UserDefault.rawValue,
    targets: [
        .implements(module: .core(.UserDefault), product: .framework)
    ]
)
