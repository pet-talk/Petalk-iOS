import SwiftUI

import ComposableArchitecture

import RootFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, RootFeature!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    RootFeatureView(
        store: .init(
            initialState: RootFeature.State.onboarding(.init()),
            reducer: {
                
            }
        )
    )
}
