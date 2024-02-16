import SwiftUI

import ComposableArchitecture

import OnboardingFeature

@main
struct DemoApp: App {
  var body: some Scene {
    WindowGroup {
        OnboardingFeatureView(
            store: .init(
                initialState: .init(),
                reducer: {
                    OnboardingFeature()
                }
            )
        )
    }
  }
}
