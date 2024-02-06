import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")

private let template = Template(
    description: "A template for a new module's sources target",
    attributes: [
        layerAttribute,
        nameAttribute
    ],
    items: [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Sources/\(nameAttribute).swift",
            templatePath: "Source.stencil"
        ),
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Sources/\(nameAttribute)+Action.swift",
            templatePath: "Source+Action.stencil"
        ),
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Sources/\(nameAttribute)+State.swift",
            templatePath: "Source+State.stencil"
        ),
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Sources/\(nameAttribute)View.swift",
            templatePath: "SourceView.stencil"
        ),
    ]
)
