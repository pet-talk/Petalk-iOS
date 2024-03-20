import SwiftUI

import ComposableArchitecture

import PetParentMainTabFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            WithPerceptionTracking {
                PetParentMainTabFeatureView(
                    store: .init(
                        initialState: PetParentMainTabFeature.State.initialState,
                        reducer: {
                            PetParentMainTabFeature()
                        }
                    )
                )
            }
        }
    }
}

// MARK: - Preview

#Preview {
    PetParentMainTabFeatureView(
        store: .init(
            initialState: PetParentMainTabFeature.State.initialState,
            reducer: {
                PetParentMainTabFeature()
            }
        )
    )
}
