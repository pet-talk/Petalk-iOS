import ComposableArchitecture
import TCACoordinators

@Reducer
public struct MyPageCoordinator {
    public struct State: Equatable, IndexedRouterState {
        public static let initialState = State(
            routes: [.root(.temp(.init()))]
        )
        
        public var routes: [Route<MyPageScreen.State>]
        
        public init(routes: [Route<MyPageScreen.State>]) {
            self.routes = routes
        }
    }
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: MyPageScreen.Action)
        case updateRoutes([Route<MyPageScreen.State>])
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
            MyPageScreen.temp(.init())
        }
    }
}
