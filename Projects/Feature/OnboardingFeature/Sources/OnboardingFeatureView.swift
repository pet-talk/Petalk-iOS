import SwiftUI

import ComposableArchitecture

// MARK: - View

public struct OnboardingFeatureView: View {
    @ObservedObject
    private var viewStore: ViewStoreOf<OnboardingFeature>
    private let store: StoreOf<OnboardingFeature>
    
    public init(store: StoreOf<OnboardingFeature>) {
        self.viewStore = .init(store, observe: { $0 })
        self.store = store
    }
    
    public var body: some View {
        List {
            Text("Hello, OnboardingFeature!")
        }
        .task {
            await viewStore
                .send(.onAppear)
                .finish()
        }
    }
}

// MARK: - Preview

#Preview {
    OnboardingFeatureView(
        store: .init(
            initialState: .init(),
            reducer: {
                OnboardingFeature()
            }
        )
    )
}
