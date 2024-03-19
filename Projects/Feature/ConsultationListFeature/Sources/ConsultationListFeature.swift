import ComposableArchitecture

@Reducer
public struct ConsultationListFeature {
    @ObservableState
    public struct State: Equatable {
        public static let initialState: State = .init()
        
    }

    public enum Action: ViewAction {
        case view(View)
    }

    public enum View: BindableAction {
        case onAppear
        case binding(BindingAction<State>)
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Reduce { state, action in
            switch action {
            case .view:
                return .none
            }
        }
    }
}
