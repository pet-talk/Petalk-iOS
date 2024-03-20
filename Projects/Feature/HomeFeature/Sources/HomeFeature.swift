import ComposableArchitecture

import BaseFeature
import UserDefault

@Reducer
public struct HomeFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        public static let initialState = State()
        
    }
    
    public enum Action: ViewAction {
        case view(View)
        case delegate(Delegate)
        
        public enum Delegate: Equatable {
            case switchTabTo(Tab.PetParent)
        }
    }
    
    public enum View: BindableAction {
        case onAppear
        case didSwitchTabTo(Tab.PetParent)
        case binding(BindingAction<State>)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Reduce { state, action in
            switch action {
            case .view(.onAppear):
                return .none
                
            case .view(.binding):
                return .none
                
            case .view(.didSwitchTabTo(let tab)):
                return .send(.delegate(.switchTabTo(tab)))
                
            case .delegate(_):
                return .none
            }
        }
    }
}
