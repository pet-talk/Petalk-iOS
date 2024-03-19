import SwiftUI

import ComposableArchitecture
import DesignSystem

// MARK: - View

@ViewAction(for: ConsultingFeature.self)
public struct ConsultingFeatureView: View {
    public let store: StoreOf<ConsultingFeature>

    public init(store: StoreOf<ConsultingFeature>) {
        self.store = store
    }

    public var body: some View {
        List {
            Text("Hello, ConsultingFeature!")
        }
        .task {
//            send(.onAppear)
        }
    }
}
