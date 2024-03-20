import SwiftUI

import ComposableArchitecture

import SplashFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, SplashFeature!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    SplashFeatureView(
        store: .init(
            initialState: .init(),
            reducer: {
                SplashFeature()
            }
        )
    )
}
