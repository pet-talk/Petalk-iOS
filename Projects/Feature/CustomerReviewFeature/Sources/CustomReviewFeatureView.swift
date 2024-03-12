import SwiftUI

import ComposableArchitecture
import DesignSystem

// MARK: - View

@ViewAction(for: CustomerReviewFeature.self)
public struct CustomerReviewFeatureView: View {
    public let store: StoreOf<CustomerReviewFeature>

    public init(store: StoreOf<CustomerReviewFeature>) {
        self.store = store
    }

    public var body: some View {
        List {
            Text("Hello, CustomReviewFeature!")
        }
        .task {
            await send(.onAppear)
                .finish()
        }
    }
}
