import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Shared.ThirdParty.rawValue,
  targets: [
    .implements(module: .shared(.ThirdParty), dependencies: [
      
    ]),
    .testing(module: .shared(.ThirdParty), dependencies: [
      .shared(target: .ThirdParty)
    ]),
    .tests(module: .shared(.ThirdParty), dependencies: [
      .shared(target: .ThirdParty)
    ]),
    .demo(module: .shared(.ThirdParty), dependencies: [
      .shared(target: .ThirdParty)
    ])
  ]
)
