import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.UserInterface.DesignSystem.rawValue,
  targets: [
    .interface(module: .userInterface(.DesignSystem)),
    .implements(
      module: .userInterface(.DesignSystem),
      resources: "Resources/**",
      dependencies: [
        .userInterface(target: .DesignSystem, type: .interface)
      ]
    ),
    .testing(module: .userInterface(.DesignSystem), dependencies: [
      .userInterface(target: .DesignSystem, type: .interface)
    ]),
    .tests(module: .userInterface(.DesignSystem), dependencies: [
      .userInterface(target: .DesignSystem)
    ]),
    .demo(module: .userInterface(.DesignSystem), dependencies: [
      .userInterface(target: .DesignSystem)
    ])
  ]
)
