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
            case .onboarding(<#T##OnboardingFeature.Action#>)
            }
        }.ifCaseLet(\.onboarding, action: \.onboarding) {
            OnboardingFeature()
        }
        .ifCaseLet(\.mainTab, action: \.mainTab) {
            MainTabFeature()
        }
    }
    
//    public var body: some Reducer<State, Action> {
//        BindingReducer(action: \.view)
//        Reduce<State, Action> { state, action in
//            switch action {
//            case .view:
//                return .none
//            }
//        }
//    }
}
