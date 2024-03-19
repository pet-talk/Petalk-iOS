import SwiftUI

import ComposableArchitecture

import RootFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            RootFeatureView(
                store: .init(
                    initialState: RootFeature.State.onboarding(.init()),
                    reducer: {
                        RootFeature.onboarding(.init())
                    }
                )
            )
        }
    }
}

// MARK: - Preview

#Preview {
    RootFeatureView(
        store: .init(
            initialState: RootFeature.State.onboarding(.init()),
            reducer: {
                RootFeature.onboarding(.init())
            }
        )
    )
}
