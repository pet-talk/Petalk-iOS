import ComposableArchitecture
import TCACoordinators

@Reducer
public struct RootCoordinator {
    public struct State: Equatable, IndexedRouterState {
        public var routes: [Route<RootScreen.State>]
        
        public init(
            routes: [Route<RootScreen.State>] = [
                .root(.onboarding(.init()), embedInNavigationView: true)
            ]
        ) {
            self.routes = routes
        }
    }
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: RootScreen.Action)
        case updateRoutes([Route<RootScreen.State>])
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, .onboarding(.loginResponse(.success))):
                state.routes = [
                    .root(.mainTab(.init()), embedInNavigationView: true)
                ]
            case .routeAction(_, .onboarding):
                state.routes = [
                    .root(.onboarding(.init()), embedInNavigationView: true)
                ]
            case .routeAction(_, .mainTab):
                state.routes = [
                    .root(.mainTab(.init()), embedInNavigationView: true)
                ]
            default:
                break
            }
            
            return .none
        }
        .forEachRoute {
            RootScreen.onboarding(.init())
        }
    }
}
