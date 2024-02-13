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
    items: TemplateType.allCases.map { $0.item }
)

private enum TemplateType: CaseIterable {
    case `default`
    
    var item: Template.Item {
        switch self {
        case .default:
            return .string(
                path: .basePath + "\(nameAttribute).swift",
                contents: emptyContents
            )
        }
    }
}

private extension String {
    static var basePath: String {
        "Projects/\(layerAttribute)/\(nameAttribute)"
    }
}
