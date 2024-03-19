import SwiftUI

import ComposableArchitecture

import HomeFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            HomeFeatureView(
                store: .init(
                    initialState: HomeFeature.State.initialState,
                    reducer: {
                        HomeFeature()
                    }
                )
            )
        }
    }
}

// MARK: - Preview

#Preview {
    HomeFeatureView(
        store: .init(
            initialState: HomeFeature.State.initialState,
            reducer: {
                HomeFeature()
            }
        )
    )
}
