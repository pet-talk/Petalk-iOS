import SwiftUI

import ComposableArchitecture

// MARK: - View

public struct SwiftUIUtilityView: View {
  @ObservedObject
  private var viewStore: ViewStoreOf<SwiftUIUtility>
  private let store: StoreOf<SwiftUIUtility>

  public init(store: StoreOf<SwiftUIUtility>) {
    self.viewStore = .init(store, observe: { $0 })
    self.store = store
  }

  public var body: some View {
    List {
      Text("Hello, SwiftUIUtility!")
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
  SwiftUIUtilityView(
    store: .init(
      initialState: .init(),
      reducer: {
          SwiftUIUtility()
      }
    )
  )
}
