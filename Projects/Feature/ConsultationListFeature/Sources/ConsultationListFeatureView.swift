import SwiftUI

import ComposableArchitecture
import DesignSystem

// MARK: - View

@ViewAction(for: ConsultationListFeature.self)
public struct ConsultationListFeatureView: View {
    public let store: StoreOf<ConsultationListFeature>

    public init(store: StoreOf<ConsultationListFeature>) {
        self.store = store
    }

    public var body: some View {
        List {
            Text("Hello, ConsultationListFeature!")
        }
        .task {
            await send(.onAppear)
                .finish()
        }
    }
}
