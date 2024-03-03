import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Shared.SwiftUIUtility.rawValue,
    targets: [
        .implements(module: .shared(.SwiftUIUtility))
    ]
)
