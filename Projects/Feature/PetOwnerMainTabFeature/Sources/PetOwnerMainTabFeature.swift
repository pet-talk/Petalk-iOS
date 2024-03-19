import ComposableArchitecture

import BaseFeature
import HomeFeature
import SearchFeature
import ConsultingFeature
import MyPageFeature

@Reducer
public struct PetOwnerMainTabFeature {
    @ObservableState
    public struct State: Equatable {
        public static let initialState = State(
            home: .initialState,
            search: .initialState,
            consulting: .initialState,
            myPage: .initialState,
            selectedTab: .home
        )
        
        var home: HomeFeature.State
        var search: SearchFeature.State
        var consulting: ConsultingFeature.State
        var myPage: MyPageFeature.State
        
        var selectedTab: Tab.PetOwner
    }
    
    public enum Action {
        case home(HomeFeature.Action)
        case search(SearchFeature.Action)
        case consulting(ConsultingFeature.Action)
        case myPage(MyPageFeature.Action)
        case tabSelected(Tab.PetOwner)
        case delegate(Delegate)
    }
    
    public enum Delegate {
        case didLogout
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Scope(state: \.home, action: \.home) {
            HomeFeature()
        }
        Scope(state: \.search, action: \.search) {
            SearchFeature()
        }
        Scope(state: \.consulting, action: \.consulting) {
            ConsultingFeature()
        }
        Scope(state: \.myPage, action: \.myPage) {
            MyPageFeature()
        }
        
        Reduce { state, action in
            switch action {
            case .myPage(.delegate(.didLogout)):
                return .send(.delegate(.didLogout))
                
            case .home, .search, .consulting, .myPage:
                return .none
                
            case let .tabSelected(tab):
                state.selectedTab = tab
                return .none
                
            case .delegate:
                return .none
            }
        }
    }
}
