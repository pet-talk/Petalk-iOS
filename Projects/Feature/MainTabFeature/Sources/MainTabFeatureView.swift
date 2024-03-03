import SwiftUI

import ComposableArchitecture
import DesignSystem

// MARK: - View

@ViewAction(for: MainTabFeature.self)
public struct MainTabFeatureView: View {
    public let store: StoreOf<MainTabFeature>
    
    public init(store: StoreOf<MainTabFeature>) {
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
