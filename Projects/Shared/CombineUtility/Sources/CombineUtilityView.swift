import SwiftUI

import ComposableArchitecture

// MARK: - View

public struct CombineUtilityView: View {
  @ObservedObject
  private var viewStore: ViewStoreOf<CombineUtility>
  private let store: StoreOf<CombineUtility>

  public init(store: StoreOf<CombineUtility>) {
    self.viewStore = .init(store, observe: { $0 })
    self.store = store
  }

  public var body: some View {
    List {
      Text("Hello, CombineUtility!")
    }
    .task {
      await viewStore
        .send(.onAppear)
        .finish()
    }
  }
}

// MARK: - Preview

#Preview {
  CombineUtilityView(
    store: .init(
      initialState: .init(),
      reducer: {
          CombineUtility()
      }
    )
  )
}
