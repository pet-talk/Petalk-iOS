import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")

private let DomainTemplate = Template(
    description: "A template for a new module's domain sources target",
    attributes: [
        layerAttribute,
        nameAttribute
    ],
    items: [
        .file(
            path: .basePath + "/Interface/\(nameAttribute).swift",
            templatePath: "Client.stencil"
        ),
        .file(
            path: .basePath + "/Sources/Live\(nameAttribute).swift",
            templatePath: "LiveClient.stencil"
        )
    ]
)

private extension String {
    static var basePath: String {
        "Projects/\(layerAttribute)/\(nameAttribute)"
    }
}
