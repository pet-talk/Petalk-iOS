import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")

private let appContents = """
import SwiftUI

import ComposableArchitecture

import \(nameAttribute)

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, \(nameAttribute)!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    \(nameAttribute)View(
        store: .init(
            initialState: .init(),
            reducer: {
                \(nameAttribute)()
            }
        )
    )
}
"""

private let template = Template(
    description: "A template for a new module's demo target",
    attributes: [
        layerAttribute,
        nameAttribute
    ],
    items: [
        .string(path: "Projects/\(layerAttribute)/\(nameAttribute)/Demo/Sources/DemoApp.swift", contents: appContents)
    ]
)
