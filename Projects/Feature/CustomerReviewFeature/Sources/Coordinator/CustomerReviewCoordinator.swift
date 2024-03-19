import ComposableArchitecture
import TCACoordinators

@Reducer
public struct CustomerReviewCoordinator {
    public struct State: Equatable, IndexedRouterState {
        public var routes: [Route<CustomerReviewScreen.State>]
        
        public init(
            routes: [Route<CustomerReviewScreen.State>] = [
                .root(.temp(.initialState))
            ]
        ) {
            self.routes = routes
        }
    }
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: CustomerReviewScreen.Action)
        case updateRoutes([Route<CustomerReviewScreen.State>])
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
            CustomerReviewScreen.temp(.init())
        }
    }
}
