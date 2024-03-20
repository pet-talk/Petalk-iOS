import ComposableArchitecture

import AuthDomain
import Logger
import UserDefault

@Reducer
public struct OnboardingFeature {
    @ObservableState
    public struct State: Equatable {
        var loginMethod: SocialLoginMethod?
        var isLoading: Bool = false
        
        @Presents var alert: AlertState<Action.Alert>?
        
        public init() {}
    }
    
    public enum Action: ViewAction {
        case loginResponse(Result<User, Error>)
        case alert(PresentationAction<Alert>)
        case view(View)
        
        public enum Alert: Equatable {}
    }
    
    public enum View: BindableAction {
        case binding(BindingAction<State>)
        case loginButtonTapped
    }
    
    @Dependency(\.authClient) var authClient
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Reduce { state, action in
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
                            return user
                        }
                    ))
                }
                
            case let .loginResponse(.success(user)):
                state.isLoading = false
                Log.debug(user)
                
                UserDefaultClient.loggedInUserAuthority = user.userAuthority.rawValue
                UserDefaultClient.loggedInMethod = state.loginMethod?.rawValue
                
                return .none
                
            case let .loginResponse(.failure(error)):
                state.alert = AlertState { TextState(error.localizedDescription) }
                state.isLoading = false
                Log.error(error)
                
                UserDefaultClient.deleteLoggedInInfo()
                
                return .none
                
            case .alert:
                return .none
            }
        }
    }
}
