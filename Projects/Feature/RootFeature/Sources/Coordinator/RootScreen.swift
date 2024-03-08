import ComposableArchitecture

import OnboardingFeature
import MainTabFeature

@Reducer(state: .equatable)
public enum RootScreen {
    case onboarding(OnboardingFeature)
    case mainTab(MainTabFeature)
    
    public static var body: some ReducerOf<Self> {
        Scope(state: \.onboarding, action: \.onboarding) {
            OnboardingFeature()
        }
        Scope(state: \.mainTab, action: \.mainTab) {
            MainTabFeature()
        }
    }
}
