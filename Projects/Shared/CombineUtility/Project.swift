import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Shared.CombineUtility.rawValue,
    targets: [
        .implements(module: .shared(.CombineUtility))
    ]
)
