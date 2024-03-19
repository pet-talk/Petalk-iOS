import SwiftUI

import ComposableArchitecture

import OnboardingFeature
import PetOwnerMainTabFeature
import VetMainTabFeature
import AuthDomain
import UserDefault

@Reducer(state: .equatable)
public enum RootFeature {
    case onboarding(OnboardingFeature)
    case petowner(PetOwnerMainTabFeature)
    case vet(VetMainTabFeature)
    
//    public enum State: Equatable {
//        case onboarding(OnboardingFeature.State)
//        case petowner(PetOwnerMainTabFeature.State)
//        case vet(VetMainTabFeature.State)
//    }
//    
//    public enum Action {
//        case onboarding(OnboardingFeature.Action)
//        case petowner(PetOwnerMainTabFeature.Action)
//        case vet(VetMainTabFeature.Action)
//    }
    
//    public init() {}
    
    public static var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            
//            case .checkLoggedIn:
//                guard let userAuthority = loggedInUserAuthority() else {
//                    return .none
//                }
//                switch userAuthority {
//                case .petOwner:
//                    state = .petowner(.initialState)
//                case .vet:
//                    state = .vet(.initialState)
//                }
//                return .none
                
            case .onboarding(.loginResponse(.success(let user))):
                switch user.userAuthority {
                case .petOwner:
                    state = .petowner(.initialState)
                case .vet:
                    state = .vet(.initialState)
                }
                return .none
                
            case .petowner(.delegate(.didLogout)):
                state = .onboarding(.init())
                return .none
                
            case .onboarding:
                return .none
            case .petowner:
                return .none
            case .vet:
                return .none
            }
        }
        .ifCaseLet(\.onboarding, action: \.onboarding, then: {
            OnboardingFeature()
        })
        .ifCaseLet(\.petowner, action: \.petowner, then: {
            PetOwnerMainTabFeature()
        })
        .ifCaseLet(\.vet, action: \.vet, then: {
            VetMainTabFeature()
        })
        ._printChanges()
    }
    
    public static func loggedInUserAuthority() -> User.Authority? {
        guard
            let loggedInUserId = UserDefaultClient.userId,
            let loggedInUserNickname = UserDefaultClient.nickname,
            let loggedInUserAuthority = UserDefaultClient.userAuthority,
            let userAuthority = User.Authority(rawValue: loggedInUserAuthority)
        else {
            return nil
        }
        
        return userAuthority
    }
}
