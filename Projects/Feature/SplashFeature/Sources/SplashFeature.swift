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
        case delegate(Delegate)
        
        public enum Delegate {
            case login
        }
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                let userAuthority = loggedInUserAuthority()
                
                return .send(.delegate(.login))
                
            case .delegate:
                return .none
            }
        }
    }
}

private extension SplashFeature {
    private func loggedInUserAuthority() -> User.Authority? {
        guard validateLoggedInUser() else { return nil }
        guard
            let loggedInUserAuthority = UserDefaultClient.userAuthority,
            let userAuthority = User.Authority(rawValue: loggedInUserAuthority)
        else {
            return nil
        }
        
        return userAuthority
    }
    
    private func validateLoggedInUser() -> Bool {
        guard
            let loggedInUserId = UserDefaultClient.userId, !loggedInUserId.isEmpty,
            let loggedInUserNickname = UserDefaultClient.nickname, !loggedInUserNickname.isEmpty,
            let loggedInUserAuthority = UserDefaultClient.userAuthority, !loggedInUserAuthority.isEmpty
        else {
            return false
        }
        
        return true
    }
}
