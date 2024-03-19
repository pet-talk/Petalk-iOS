import ComposableArchitecture
import TCACoordinators

@Reducer
public struct ConsultationListCoordinator {
    public struct State: Equatable, IndexedRouterState {
        public var routes: [Route<ConsultationListScreen.State>]
        
        public init(
            routes: [Route<ConsultationListScreen.State>] = [
                .root(.temp(.initialState))
            ]
        ) {
            self.routes = routes
        }
    }
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: ConsultationListScreen.Action)
        case updateRoutes([Route<ConsultationListScreen.State>])
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .routeAction(_, .temp):
                break
                
            default:
                break
            }
            
            return .none
        }
        .forEachRoute {
            ConsultationListScreen.temp(.init())
        }
    }
}
