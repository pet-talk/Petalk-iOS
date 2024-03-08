import ComposableArchitecture

import OnboardingFeature
import MainTabFeature

@Reducer(state: .equatable)
public enum RootFeature {
    case onboarding(OnboardingFeature)
    case mainTab(MainTabFeature)
    
    public static var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onboarding(.loginResponse(.success)):
                state = .mainTab(.init())
                return .none
            case .onboarding:
                return .none
            case .mainTab(_):
                return .none
            }
        }.ifCaseLet(\.onboarding, action: \.onboarding) {
            OnboardingFeature()
        }
        .ifCaseLet(\.mainTab, action: \.mainTab) {
            MainTabFeature()
        }
    }
}
