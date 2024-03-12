import ComposableArchitecture

import BaseFeature
import HomeFeature
import CustomerReviewFeature
import ConsultationListFeature
import MyPageFeature

@Reducer
public struct VetMainTabFeature {
    @ObservableState
    public struct State: Equatable {
        var selectedTab: Tab.Veterinarian = .home
        
        var home: HomeFeature.State = .init()
        var customerReview: CustomerReviewFeature.State = .init()
        var consultationList: ConsultationListFeature.State = .init()
        var myPage: MyPageFeature.State = .init()
        
        public init() {}
    }
    
    public enum Action {
        case home(HomeFeature.Action)
        case customerReview(CustomerReviewFeature.Action)
        case consultationList(ConsultationListFeature.Action)
        case myPage(MyPageFeature.Action)
        case selectTab(Tab.Veterinarian)
    }
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .home, .customerReview, .consultationList, .myPage:
                return .none
            case let .selectTab(tab):
                state.selectedTab = tab
                return .none
            }
        }
    }
}
