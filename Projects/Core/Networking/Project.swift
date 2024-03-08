import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Core.Networking.rawValue,
    targets: [
        .implements(
            module: .core(.Networking),
            product: .framework,
            spec: .init(
                infoPlist: .extendingDefault(with: [
                    "BASE_URL":"$(BASE_URL)"
                ]),
                dependencies: [
                    .SPM.Alamofire,
                ]
            )
        ),
        .testing(module: .core(.Networking), dependencies: [
            .core(target: .Networking)
        ]),
        .tests(module: .core(.Networking), dependencies: [
            .core(target: .Networking)
        ])
    ]
)
