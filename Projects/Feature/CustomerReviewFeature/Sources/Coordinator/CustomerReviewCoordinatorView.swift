import SwiftUI

import ComposableArchitecture
import TCACoordinators

public struct CustomerReviewCoordinatorView: View {
    private let store: StoreOf<CustomerReviewCoordinator>
    
    public init(store: StoreOf<CustomerReviewCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .temp:
                    CaseLet(
                        /CustomerReviewScreen.State.temp,
                         action: CustomerReviewScreen.Action.temp,
                         then: CustomerReviewFeatureView.init
                    )
                }
            }
        }
    }
}
