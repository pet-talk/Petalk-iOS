import SwiftUI

import ComposableArchitecture

import VetMainTabFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, VetMainTabFeature!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    VetMainTabFeatureView(
        store: .init(
            initialState: .init(),
            reducer: {
                VetMainTabFeature()
            }
        )
    )
}
