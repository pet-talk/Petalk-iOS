import SwiftUI

import ComposableArchitecture

import DesignSystem

// MARK: - View

public struct SplashFeatureView: View {
    private let store: StoreOf<SplashFeature>

    public init(store: StoreOf<SplashFeature>) {
        self.store = store
    }

    public var body: some View {
        GeometryReader(content: { geometry in
            Image(R.splash)
                .resizable()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .onAppear(perform: {
                    store.send(.onAppear)
                })
        })
        .ignoresSafeArea(edges: .all)
    }
}
