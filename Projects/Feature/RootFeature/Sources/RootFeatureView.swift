import SwiftUI

import ComposableArchitecture
import DesignSystem

// MARK: - View

@ViewAction(for: RootFeature.self)
public struct RootFeatureView: View {
    public let store: StoreOf<RootFeature>
    
    public init(store: StoreOf<RootFeature>) {
        self.store = store
    }
    
    public var body: some View {
        List {
            Text("Hello, RootFeature!")
        }
        .task {
            await send(.onAppear)
                .finish()
        }
    }
}

// MARK: - Preview

#Preview {
    RootFeatureView(
        store: .init(
            initialState: .init(),
            reducer: {
                RootFeature()
            }
        )
    )
}
