import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")
private let name = "\(nameAttribute)".replacingOccurrences(of: "\(layerAttribute)", with: "")

private let clientName = name + "Client"
private let clientContent: String = """
import Foundation

import Dependencies
import DependenciesMacros

extension DependencyValues {
    public var \(clientName): \(clientName) {
        get { self[\(clientName).self] }
        set { self[\(clientName).self] = newValue }
    }
}

@DependencyClient
public struct \(clientName): Sendable {
    public var greeting: @Sendable (_ name: String) async throws -> String
}

extension \(clientName): TestDependencyKey {
    public static let testValue = Self(
        greeting: { name in
            // Delay the task by 1 second
            try await Task.sleep(nanoseconds: 1_000_000_000)
            
            return "Hello, \\(name)"
        }
    )
    public static var previewValue: \(clientName) = testValue
}

extension \(clientName): DependencyKey {
    public static let liveValue = Self(
        greeting: { name in
            // Delay the task by 1 second
            try await Task.sleep(nanoseconds: 1_000_000_000)
            
            return "Hello, \\(name)"
        }
    )
}
"""



private let DomainTemplate = Template(
    description: "A template for a new module's domain sources target",
    attributes: [
        layerAttribute,
        nameAttribute
    ],
    items: [
        .string(
            path: .basePath + "/Sources/Public/Client/\(clientName).swift",
            contents: clientContent
        )
    ]
)

private extension String {
    static var basePath: String {
        "Projects/\(layerAttribute)/\(nameAttribute)"
    }
}
