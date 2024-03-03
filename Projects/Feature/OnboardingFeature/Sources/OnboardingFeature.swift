import ComposableArchitecture

import AuthDomainInterface
import Logger

@Reducer
public struct OnboardingFeature {
    @ObservableState
    public struct State: Equatable {
        public var loginMethod: SocialLoginMethod?
        public var isLoading: Bool = false
        
        @Presents public var alert: AlertState<Action.Alert>?
        
        public init() {}
    }
    
    public enum Action: ViewAction {
        case loginResponse(Result<User, Error>)
        case alert(PresentationAction<Alert>)
        case view(View)
        
        public enum Alert: Equatable, Sendable {}
    }
    
    public enum View: BindableAction {
        case binding(BindingAction<State>)
        case loginButtonTapped
    }
    
    @Dependency(\.authClient) var authClient
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {
            case .view(.binding):
                return .none
                
            case .view(.loginButtonTapped):
                state.isLoading = true
                return .run { [loginMethod = state.loginMethod] send in
                    guard let loginMethod else { return }
                    
                    await send(.loginResponse(
                        Result {
                            let user = try await authClient.requestLogin(loginMethod: loginMethod)
                            Log.debug(user)
                            return user
                        }
                    ))
                    
                }
            case let .loginResponse(.success(response)):
                state.isLoading = false
                
                return .none
            case let .loginResponse(.failure(error)):
                state.alert = AlertState { TextState(error.localizedDescription) }
                state.isLoading = false
                return .none
            case .alert:
                return .none
            }
        }
    }
}

// 분리가 필요한가?? 고민해보자...
// requestLogin -> OnboardingFeature??
// requestMe -> UserFeature??
