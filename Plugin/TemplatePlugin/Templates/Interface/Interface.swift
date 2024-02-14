import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")

private let emptyContents = """
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
            path: .basePath + "/Interface/Interface.swift",
            contents: emptyContents
        )
    ]
)

private extension String {
    static var basePath: String {
        "Projects/\(layerAttribute)/\(nameAttribute)"
    }
}
