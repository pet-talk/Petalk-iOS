import SwiftUI

import ComposableArchitecture
import TCACoordinators

public struct HomeCoordinatorView: View {
    private let store: StoreOf<HomeCoordinator>
    
    public init(store: StoreOf<HomeCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .temp:
                    CaseLet(
                        /HomeScreen.State.temp,
                         action: HomeScreen.Action.temp,
                         then: HomeFeatureView.init
                    )
                }
            }
        }
    }
}
