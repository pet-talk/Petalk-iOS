import ComposableArchitecture

import BaseFeature

@Reducer
public struct HomeFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        
        public init() {}
    }
    
    public enum Action: ViewAction {
        case view(View)
        case delegate(Delegate)
        
        public enum Delegate: Equatable {
            case switchTabTo(Tab.PetOwner)
        }
    }
    
    public enum View: BindableAction {
        case onAppear
        case didSwitchTabTo(Tab.PetOwner)
        case binding(BindingAction<State>)
    }
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
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
