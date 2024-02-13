import ComposableArchitecture
import AuthClientInterface

@Reducer
public struct OnboardingFeature {
    @ObservableState
    public struct State: Equatable {
        public var loginType: LoginType?
        
        public init() {}
    }
    
    public enum Action: ViewAction {
        case view(View)
    }
    
    public enum View: BindableAction {
        case binding(BindingAction<State>)
        case loginButtonTapped(LoginType)
    }
    
    @Dependency(\.authClient) var authClient
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {
            case .view(.binding):
                return .none
                
            case .view(.loginButtonTapped(let loginType)):
                state.loginType = loginType
                return .run { send in
                    let text = try await authClient.greeting(name: "\(loginType)")
                    print(text)
                }
            }
        }
    }
}

extension OnboardingFeature {
    public enum LoginType: CaseIterable {
        case kakao
        case naver
        case apple
    }
}
