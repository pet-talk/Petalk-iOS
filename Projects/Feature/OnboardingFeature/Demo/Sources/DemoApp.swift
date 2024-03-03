import SwiftUI

import ComposableArchitecture

import OnboardingFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, OnboardingFeature!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    OnboardingFeatureView(
        store: Store(
            initialState: OnboardingFeature.State(),
            reducer: {
                OnboardingFeature()
            }
        )
    )
}
