import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")
private let nameWithoutLayer = "\(nameAttribute)"
  .replacingOccurrences(of: "\(layerAttribute)", with: "")

private let featureInterfaceContents = """
// This is for Tuist

"""

private let template = Template(
  description: "A template for a new module's interface target",
  attributes: [
    layerAttribute,
    nameAttribute
  ],
  items: [
    .string(
      path: "Projects/\(layerAttribute)/\(nameAttribute)/Interface/\(nameWithoutLayer)Interface.swift",
      contents: featureInterfaceContents
    )
  ]
)
