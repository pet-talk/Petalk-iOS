import SwiftUI

import ComposableArchitecture
import TCACoordinators

public struct ConsultingCoordinatorView: View {
    private let store: StoreOf<ConsultingCoordinator>
    
    public init(store: StoreOf<ConsultingCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .temp:
                    CaseLet(
                        /ConsultingScreen.State.temp,
                         action: ConsultingScreen.Action.temp,
                         then: ConsultingFeatureView.init
                    )
                }
            }
        }
    }
}
