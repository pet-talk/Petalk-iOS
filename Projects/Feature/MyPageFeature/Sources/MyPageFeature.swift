import ComposableArchitecture

import UserDefault

@Reducer
public struct MyPageFeature {
    @ObservableState
    public struct State: Equatable {
        public static let initialState: State = .init()
        
    }

    public enum Action: ViewAction {
        case view(View)
        case delegate(Delegate)
    }

    public enum View: BindableAction {
        case onAppear
        case logoutButtonTapped
        case binding(BindingAction<State>)
    }
    
    public enum Delegate {
        case didLogout
    }
    
    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Reduce { state, action in
            switch action {
            case .view(.logoutButtonTapped):
                UserDefaultClient.deleteLoggedInInfo()
                return .send(.delegate(.didLogout))
                
            case .delegate:
                return .none
                
            case .view:
                return .none
            }
        }
    }
}
