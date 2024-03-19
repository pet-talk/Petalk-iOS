import SwiftUI

import ComposableArchitecture
import TCACoordinators

public struct ConsultationListCoordinatorView: View {
    private let store: StoreOf<ConsultationListCoordinator>
    
    public init(store: StoreOf<ConsultationListCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .temp:
                    CaseLet(
                        /ConsultationListScreen.State.temp,
                         action: ConsultationListScreen.Action.temp,
                         then: ConsultationListFeatureView.init
                    )
                }
            }
        }
    }
}
