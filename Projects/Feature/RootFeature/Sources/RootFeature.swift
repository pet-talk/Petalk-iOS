import SwiftUI

import ComposableArchitecture

import SplashFeature
import OnboardingFeature
import PetParentMainTabFeature
import VetMainTabFeature

@Reducer
public struct RootFeature {
    @Reducer
    public struct Scene {
        public enum State: Equatable {
            case splash(SplashFeature.State)
            case onboarding(OnboardingFeature.State)
            case petParent(PetParentMainTabFeature.State)
            case vet(VetMainTabFeature.State)
        }
        
        public enum Action {
            case splash(SplashFeature.Action)
            case onboarding(OnboardingFeature.Action)
            case petParent(PetParentMainTabFeature.Action)
            case vet(VetMainTabFeature.Action)
        }
        
        public var body: some ReducerOf<Self> {
            Scope(state: \.splash, action: \.splash) {
                SplashFeature()
            }
            Scope(state: \.onboarding, action: \.onboarding) {
                OnboardingFeature()
            }
            Scope(state: \.petParent, action: \.petParent) {
                PetParentMainTabFeature()
            }
            Scope(state: \.vet, action: \.vet) {
                VetMainTabFeature()
            }
        }
    }
    
    @ObservableState
    public struct State: Equatable {
        var scene: Scene.State = .splash(.init())
        
        public init() {}
    }
    
    public enum Action {
        case scene(Scene.Action)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Scope(state: \.scene, action: \.scene) {
            Scene()
        }
        
        Reduce { state, action in
            switch action {
            case .scene(.splash(.delegate(.login))):
                state.scene = .petParent(.initialState)
                
                return .none
                
            case .scene(.onboarding(.loginResponse(.success(let user)))):
                switch user.userAuthority {
                case .petParent:
                    state.scene = .petParent(.initialState)
                case .vet:
                    state.scene = .vet(.initialState)
                }
                return .none
                
            case .scene(.petParent(.delegate(.didLogout))):
                state.scene = .onboarding(.init())
                return .none
                
            case .scene:
                return .none
            }
        }
        ._printChanges()
    }
}
