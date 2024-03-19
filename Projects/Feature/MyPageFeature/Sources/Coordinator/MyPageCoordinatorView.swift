import SwiftUI

import ComposableArchitecture
import TCACoordinators

public struct MyPageCoordinatorView: View {
    private let store: StoreOf<MyPageCoordinator>
    
    public init(store: StoreOf<MyPageCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .temp:
                    CaseLet(
                        /MyPageScreen.State.temp,
                         action: MyPageScreen.Action.temp,
                         then: MyPageFeatureView.init
                    )
                }
            }
        }
    }
}
