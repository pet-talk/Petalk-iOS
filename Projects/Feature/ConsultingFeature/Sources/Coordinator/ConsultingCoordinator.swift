import ComposableArchitecture
import TCACoordinators

@Reducer
public struct ConsultingCoordinator {
    public struct State: Equatable, IndexedRouterState {
        public static let initialState = State(
            routes: [.root(.temp(.init()))]
        )
        
        public var routes: [Route<ConsultingScreen.State>]
        
        public init(routes: [Route<ConsultingScreen.State>]) {
            self.routes = routes
        }
    }
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: ConsultingScreen.Action)
        case updateRoutes([Route<ConsultingScreen.State>])
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
            ConsultingScreen.temp(.init())
        }
    }
}
