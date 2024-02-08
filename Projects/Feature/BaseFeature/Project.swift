import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Feature.BaseFeature.rawValue,
  targets: [
    .implements(module: .feature(.BaseFeature), dependencies: [
      .SPM.ComposableArchitecture,
      .userInterface(target: .DesignSystem, type: .interface),
      .core(target: .CoreKit),
    ])
  ]
)
