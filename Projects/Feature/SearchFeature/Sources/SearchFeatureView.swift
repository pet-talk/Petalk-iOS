import SwiftUI

import ComposableArchitecture
import DesignSystem

// MARK: - View

@ViewAction(for: SearchFeature.self)
public struct SearchFeatureView: View {
    public let store: StoreOf<SearchFeature>

    public init(store: StoreOf<SearchFeature>) {
        self.store = store
    }

    public var body: some View {
        List {
            Text("Hello, SearchFeature!")
        }
        .task {
//            send(.onAppear)
        }
    }
}
