import SwiftUI

import ComposableArchitecture

// MARK: - View

public struct HomeFeatureView: View {
    private let store: StoreOf<HomeFeature>
    
    public init(store: StoreOf<HomeFeature>) {
        self.store = store
    }
    
    public var body: some View {
        List {
            Text("Hello, HomeFeature!")
        }
        .task {
            
        }
    }
}
