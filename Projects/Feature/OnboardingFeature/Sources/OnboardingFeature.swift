import ComposableArchitecture

import AuthClient
import Logger
import ThirdParty

@Reducer
public struct OnboardingFeature {
    @ObservableState
    public struct State: Equatable {
        public var loginMethod: SocialLoginMethod?
        
        public init() {}
    }
    
    public enum Action: ViewAction {
        case view(View)
    }
    
    public enum View: BindableAction {
        case binding(BindingAction<State>)
        case loginButtonTapped(SocialLoginMethod)
    }
    
    @Dependency(\.authClient) var authClient
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {
            case .view(.binding):
                return .none
                
            case .view(.loginButtonTapped(let loginMethod)):
                state.loginMethod = loginMethod
                return .run(operation: { _ in
                    let user = try await authClient.requestLogin(loginMethod: .kakao)
                    Log.debug(user)
                })
            }
        }
    }
}
