import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Core.Network.rawValue,
    targets: [
        .interface(module: .core(.Network)),
        .implements(module: .core(.Network), product: .staticLibrary, dependencies: [
            .core(target: .Network, type: .interface),
            .SPM.Alamofire,
        ]),
        .testing(module: .core(.Network), dependencies: [
            .core(target: .Network, type: .interface)
        ]),
        .tests(module: .core(.Network), dependencies: [
            .core(target: .Network)
        ])
    ]
)
