import SwiftUI

import ComposableArchitecture

import MainTabFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, MainTabFeature!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    MainTabFeatureView(
        store: .init(
            initialState: .init(),
            reducer: {
                MainTabFeature()
            }
        )
    )
}
