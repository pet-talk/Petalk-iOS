import SwiftUI
import ComposableArchitecture
import TCACoordinators

import OnboardingFeature
import PetOwnerMainTabFeature
import VetMainTabFeature

public struct RootCoordinatorView: View {
    private let store: StoreOf<RootCoordinator>
    
    public init(store: StoreOf<RootCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .onboarding:
                    CaseLet(
                        /RootScreen.State.onboarding,
                         action: RootScreen.Action.onboarding,
                         then: OnboardingFeatureView.init
                    )
                case .petOwnerMainTab:
                    CaseLet(
                        /RootScreen.State.petOwnerMainTab,
                         action: RootScreen.Action.petOwnerMainTab,
                         then: PetOwnerMainTabFeatureView.init
                    )
                case .vetMainTab:
                    CaseLet(
                        /RootScreen.State.vetMainTab,
                         action: RootScreen.Action.vetMainTab,
                         then: VetMainTabFeatureView.init
                    )
                }
            }
        }
    }
}
