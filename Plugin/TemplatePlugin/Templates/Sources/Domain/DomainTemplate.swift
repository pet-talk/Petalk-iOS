import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")
private let nameWithoutLayer = "\(nameAttribute)"
  .replacingOccurrences(of: "\(layerAttribute)", with: "")

private let useCaseContents = """
import Combine

import \(nameAttribute)Interface

final class \(nameWithoutLayer)UseCaseImpl: \(nameWithoutLayer)UseCase {

}
"""
private let repositoryContents = """
import Combine

import \(nameAttribute)Interface

final class \(nameWithoutLayer)RepositoryImpl: \(nameWithoutLayer)Repository {

}
"""

private let domainTemplate = Template(
  description: "A template for a new module's sources target",
  attributes: [
    layerAttribute,
    nameAttribute
  ],
  items: [
    .string(
      path: "Projects/\(layerAttribute)/\(nameAttribute)/UseCase/\(nameWithoutLayer)UseCaseImpl",
      contents: repositoryContents
    ),
    .string(
      path: "Projects/\(layerAttribute)/\(nameAttribute)/Repository/\(nameWithoutLayer)RepositoryImpl",
      contents: useCaseContents
    )
  ]
)
