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
        var selectedTab: Tab.PetOwner = .home
        
        var home: HomeFeature.State = .init()
        var search: SearchFeature.State = .init()
        var consulting: ConsultingFeature.State = .init()
        var myPage: MyPageFeature.State = .init()
        
        public init() {}
    }
    
    public enum Action {
        case home(HomeFeature.Action)
        case search(SearchFeature.Action)
        case consulting(ConsultingFeature.Action)
        case myPage(MyPageFeature.Action)
        case selectTab(Tab.PetOwner)
    }
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
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
        
        Reduce<State, Action> { state, action in
            switch action {
            case .home, .search, .consulting, .myPage:
                return .none
            case let .selectTab(tab):
                state.selectedTab = tab
                return .none
            }
        }
    }
}
