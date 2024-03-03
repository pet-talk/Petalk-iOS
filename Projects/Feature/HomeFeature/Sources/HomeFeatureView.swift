import SwiftUI

import ComposableArchitecture

// MARK: - View

public struct HomeFeatureView: View {
  @ObservedObject
  private var viewStore: ViewStoreOf<HomeFeature>
  private let store: StoreOf<HomeFeature>

  public init(store: StoreOf<HomeFeature>) {
    self.viewStore = .init(store, observe: { $0 })
    self.store = store
  }

  public var body: some View {
    List {
      Text("Hello, HomeFeature!")
    }
    .task {
      await viewStore
        .send(.onAppear)
        .finish()
    }
  }
}
