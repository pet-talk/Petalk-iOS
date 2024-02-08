import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")

private let appContents = """
import SwiftUI

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
"""

private let template = Template(
    description: "A template for a new module's demo target",
    attributes: [
        layerAttribute,
        nameAttribute
    ],
    items: [
      .string(path: "Projects/\(layerAttribute)/\(nameAttribute)/Demo/Sources", contents: appContents)
    ]
)
