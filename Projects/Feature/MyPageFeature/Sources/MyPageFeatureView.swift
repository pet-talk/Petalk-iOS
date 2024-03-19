import SwiftUI

import ComposableArchitecture
import DesignSystem

// MARK: - View

@ViewAction(for: MyPageFeature.self)
public struct MyPageFeatureView: View {
    public let store: StoreOf<MyPageFeature>

    public init(store: StoreOf<MyPageFeature>) {
        self.store = store
    }

    public var body: some View {
        List {
            Text("Hello, MyPageFeature!")
            Button(action: {
                send(.logoutButtonTapped)
            }, label: {
                Text("로그아웃")
            })
        }
        .task {
//            send(.onAppear)
        }
    }
}
