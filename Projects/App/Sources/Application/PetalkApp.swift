import SwiftUI

import OnboardingFeature

@main
struct PetalkApp: App {
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
