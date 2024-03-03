import ComposableArchitecture

@Reducer
public struct HomeFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        
        public init() {}
    }
    
    public enum Action: Equatable, BindableAction {
        case onAppear
        case binding(BindingAction<State>)
    }
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .none
                
            case .binding:
                return .none
            }
        }
    }
}
