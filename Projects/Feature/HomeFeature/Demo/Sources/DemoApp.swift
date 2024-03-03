import SwiftUI

import ComposableArchitecture

import HomeFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, HomeFeature!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    HomeFeatureView(
        store: .init(
            initialState: .init(),
            reducer: {
                HomeFeature()
            }
        )
    )
}
