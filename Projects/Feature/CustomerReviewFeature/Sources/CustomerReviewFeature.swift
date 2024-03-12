import ComposableArchitecture

@Reducer
public struct CustomerReviewFeature {
    @ObservableState
    public struct State: Equatable {

        public init() {}
    }

    public enum Action: ViewAction {
        case view(View)
    }

    public enum View: BindableAction {
        case onAppear
        case binding(BindingAction<State>)
    }

    public init() {}

    public var body: some Reducer<State, Action> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {
            case .view:
                return .none
            }
        }
    }
}
