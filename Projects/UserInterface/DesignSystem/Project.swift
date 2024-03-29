import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.UserInterface.DesignSystem.rawValue,
    targets: [
        .implements(
            module: .userInterface(.DesignSystem),
            product: .framework,
            resources: "Resources/**",
            dependencies: [
                
            ]
        ),
        .testing(module: .userInterface(.DesignSystem), dependencies: [
            .userInterface(target: .DesignSystem)
        ]),
        .tests(module: .userInterface(.DesignSystem), dependencies: [
            .userInterface(target: .DesignSystem)
        ]),
        .demo(module: .userInterface(.DesignSystem), dependencies: [
            .userInterface(target: .DesignSystem)
        ])
    ],
    resourceSynthesizers: [
        .custom(name: "Assets", parser: .assets, extensions: ["xcassets"])
    ]
)
