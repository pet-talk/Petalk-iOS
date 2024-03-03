import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")

private let template = Template(
    description: "A template for a new module's interface target",
    attributes: [
        layerAttribute,
        nameAttribute
    ],
    items: [
        .string(path: "Projects/\(layerAttribute)/\(nameAttribute)/Interfaces/Interface.swift", contents: "// This is for Tuist\n")
    ]
)
