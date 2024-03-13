import ComposableArchitecture
import TCACoordinators

@Reducer
public struct HomeCoordinator {
    public struct State: Equatable, IndexedRouterState {
        public var routes: [Route<HomeScreen.State>]
        
        public init(
            routes: [Route<HomeScreen.State>] = [
                .root(.temp(.init()))
            ]
        ) {
            self.routes = routes
        }
    }
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: HomeScreen.Action)
        case updateRoutes([Route<HomeScreen.State>])
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, .temp):
                break
                
            default:
                break
            }
            
            return .none
        }
        .forEachRoute {
            HomeScreen.temp(.init())
        }
    }
}
