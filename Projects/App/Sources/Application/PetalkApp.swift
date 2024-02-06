import SwiftUI
import OnboardingFeatureInterface

@main
struct PetalkApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}
