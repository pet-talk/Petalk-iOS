import SwiftUI
import ComposableArchitecture
import TCACoordinators

import OnboardingFeature
import MainTabFeature

public struct RootCoordinatorView: View {
    private let store: StoreOf<RootCoordinator>
    
    public init(store: StoreOf<RootCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { store in
            SwitchStore(store) { _ in
                CaseLet(
                    /RootScreen.State.onboarding,
                     action: RootScreen.Action.onboarding,
                     then: OnboardingFeatureView.init
                )
                CaseLet(
                    /RootScreen.State.mainTab,
                     action: RootScreen.Action.mainTab,
                     then: MainTabFeatureView.init
                )
            }
        }
    }
}
