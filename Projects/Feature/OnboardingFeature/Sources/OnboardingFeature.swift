import ComposableArchitecture

import AuthDomain
import Logger
import UserDefault

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
        
        public enum Alert: Equatable {}
    }
    
    public enum View: BindableAction {
        case binding(BindingAction<State>)
        case loginButtonTapped(SocialLoginMethod)
    }
    
    @Dependency(\.authClient) var authClient
    @Dependency(\.authClient.socialLogin) var socialLoginClient
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {
            case .view(.binding):
                return .none
                
            case let .view(.loginButtonTapped(loginMethod)):
                state.isLoading = true
                return .run { send in
                    await send(.loginResponse(
                        Result {
                            let signIn = try await socialLoginClient.requestLogin(loginMethod)
                            let user = try await authClient.authenticate(loginMethod: loginMethod, accessToken: signIn.accessToken)
                            
                            return user
                        }
                    ))
                }
            case let .loginResponse(.success(user)):
                state.isLoading = false
                Log.debug(user)
                
                UserDefaultClient.userId = user.userId
                UserDefaultClient.nickname = user.nickname
                UserDefaultClient.userAuthority = user.userAuthority.rawValue
                
                return .none
            case let .loginResponse(.failure(error)):
                state.alert = AlertState { TextState(error.localizedDescription) }
                state.isLoading = false
                Log.error(error)
                
                UserDefaultClient.deleteUserInfo()
                
                return .none
            case .alert:
                return .none
            }
        }
    }
}
