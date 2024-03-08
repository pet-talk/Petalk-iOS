import SwiftUI

import ComposableArchitecture

import DesignSystem
import OnboardingFeature
import MainTabFeature

// MARK: - View

public struct RootFeatureView: View {
    public let store: StoreOf<RootFeature>
    
    public init(
        store: StoreOf<RootFeature> = .init(
            initialState: RootFeature.State.onboarding(.init()),
            reducer: {
                RootFeature
                    .body
//                    ._printChanges()
            }
        )
    ) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            switch store.case {
            case let .onboarding(store):
                NavigationView {
                    OnboardingFeatureView(store: store)
                }
            case let .mainTab(store):
                NavigationView {
                    MainTabFeatureView(store: store)
                }
            }
        }
    }
}