import ComposableArchitecture

import UserDefault
import AuthDomain

@Reducer
public struct SplashFeature {
    @ObservableState
    public struct State: Equatable {

        public init() {}
    }

    public enum Action {
        case onAppear
        case loginResponse(Result<User, Error>)
    }
    
    @Dependency(\.authClient) var authClient
    
    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                guard 
                    let loggedInMethod = UserDefaultClient.loggedInMethod,
                    let loginMethod = SocialLoginMethod(rawValue: loggedInMethod) 
                else {
                    struct LoggedInMethodNotFoundWhenSplashOnAppear: Error {}
                    return .send(.loginResponse(.failure(LoggedInMethodNotFoundWhenSplashOnAppear())))
                }
                
                return .run { send in
                    await send(.loginResponse(
                        Result {
                            let user = try await authClient.requestLogin(loginMethod: loginMethod)
                            return user
                        }
                    ))
                }
                
            case .loginResponse:
                return .none
            }
        }
    }
}
