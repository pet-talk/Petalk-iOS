import ComposableArchitecture

import OnboardingFeature
import PetOwnerMainTabFeature
import VetMainTabFeature

@Reducer(state: .equatable)
public enum RootScreen {
    case onboarding(OnboardingFeature)
    case petOwnerMainTab(PetOwnerMainTabFeature)
    case vetMainTab(VetMainTabFeature)
    
    public static var body: some ReducerOf<Self> {
        Scope(state: \.onboarding, action: \.onboarding) {
            OnboardingFeature()
        }
        Scope(state: \.petOwnerMainTab, action: \.petOwnerMainTab) {
            PetOwnerMainTabFeature()
        }
        Scope(state: \.vetMainTab, action: \.vetMainTab) {
            VetMainTabFeature()
        }
    }
}
