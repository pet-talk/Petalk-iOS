import SwiftUI

import ComposableArchitecture
import DesignSystem

// MARK: - View

public struct VetMainTabFeatureView: View {
    public let store: StoreOf<VetMainTabFeature>

    public init(store: StoreOf<VetMainTabFeature>) {
        self.store = store
    }

    public var body: some View {
        List {
            Text("Hello, VetMainTabFeature!")
        }
        .task {
            
        }
    }
}
