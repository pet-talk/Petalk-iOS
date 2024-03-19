import SwiftUI

import ComposableArchitecture

import DesignSystem
import OnboardingFeature
import PetOwnerMainTabFeature
import VetMainTabFeature

// MARK: - View

public struct RootFeatureView: View {
    private let store: StoreOf<RootFeature>
    
    public init(store: StoreOf<RootFeature>) {
        self.store = store
    }
    
    public var body: some View {
        switch store.case {
        case .onboarding:
            if let store = store.scope(
                state: \.onboarding,
                action: \.onboarding
            ) {
                NavigationStack {
                    OnboardingFeatureView(store: store)
                }
            }
            
        case .petowner:
            if let store = store.scope(
                state: \.petowner,
                action: \.petowner
            ) {
                NavigationStack {
                    PetOwnerMainTabFeatureView(store: store)
                }
            }
            
        case .vet:
            if let store = store.scope(
                state: \.vet,
                action: \.vet
            ) {
                NavigationStack {
                    VetMainTabFeatureView(store: store)
                }
            }
        }
    }
}
