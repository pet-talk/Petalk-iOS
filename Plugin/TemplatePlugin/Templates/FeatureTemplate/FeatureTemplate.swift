import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")

private let featureTemplate = Template(
    description: "A template for a new module's feature sources target",
    attributes: [
        layerAttribute,
        nameAttribute
    ],
    items: [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Sources/\(nameAttribute).swift",
            templatePath: "Feature.stencil"
        ),
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Sources/\(nameAttribute)View.swift",
            templatePath: "FeatureView.stencil"
        ),
    ]
)
