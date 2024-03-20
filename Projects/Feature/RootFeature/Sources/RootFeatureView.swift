import SwiftUI

import ComposableArchitecture

import DesignSystem
import SplashFeature
import OnboardingFeature
import PetParentMainTabFeature
import VetMainTabFeature

// MARK: - View

public struct RootFeatureView: View {
    private let store: StoreOf<RootFeature>
    
    public init(store: StoreOf<RootFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            switch store.scene {
            case .splash:
                if let store = store.scope(
                    state: \.scene.splash,
                    action: \.scene.splash
                ) {
                    SplashFeatureView(store: store)
                }
                
            case .onboarding:
                if let store = store.scope(
                    state: \.scene.onboarding,
                    action: \.scene.onboarding
                ) {
                    NavigationStack {
                        OnboardingFeatureView(store: store)
                    }
                }
                
            case .petParent:
                if let store = store.scope(
                    state: \.scene.petParent,
                    action: \.scene.petParent
                ) {
                    NavigationStack {
                        PetParentMainTabFeatureView(store: store)
                    }
                }
                
            case .vet:
                if let store = store.scope(
                    state: \.scene.vet,
                    action: \.scene.vet
                ) {
                    NavigationStack {
                        VetMainTabFeatureView(store: store)
                    }
                }
            }
        }
    }
}
