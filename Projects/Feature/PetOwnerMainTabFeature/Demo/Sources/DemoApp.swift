import SwiftUI

import ComposableArchitecture

import PetOwnerMainTabFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            WithPerceptionTracking {
                PetOwnerMainTabFeatureView(
                    store: .init(
                        initialState: PetOwnerMainTabFeature.State.initialState,
                        reducer: {
                            PetOwnerMainTabFeature()
                        }
                    )
                )
            }
        }
    }
}

// MARK: - Preview

#Preview {
    PetOwnerMainTabFeatureView(
        store: .init(
            initialState: PetOwnerMainTabFeature.State.initialState,
            reducer: {
                PetOwnerMainTabFeature()
            }
        )
    )
}
