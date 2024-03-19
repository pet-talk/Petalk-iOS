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
        public static let initialState: State = .init(
            selectedTab: .home,
            home: .initialState,
            customerReview: .initialState,
            consultationList: .initialState,
            myPage: .initialState
        )
        
        var selectedTab: Tab.Veterinarian
        var home: HomeFeature.State
        var customerReview: CustomerReviewFeature.State
        var consultationList: ConsultationListFeature.State
        var myPage: MyPageFeature.State
    }
    
    public enum Action {
        case home(HomeFeature.Action)
        case customerReview(CustomerReviewFeature.Action)
        case consultationList(ConsultationListFeature.Action)
        case myPage(MyPageFeature.Action)
        case selectTab(Tab.Veterinarian)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
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
