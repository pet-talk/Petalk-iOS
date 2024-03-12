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
        Reduce<State, Action> {
            state,
            action in
            switch action {
            case let .routeAction(_, .onboarding(.loginResponse(.success(user)))):
                let screenState: RootScreen.State = user.userAuthority == .petOwner
                ? .petOwnerMainTab(.init())
                : .vetMainTab(.init())
                
                state.routes = [.root(
                    screenState,
                    embedInNavigationView: true
                )]
                
            case .routeAction(_, .onboarding):
                state.routes = [.root(
                    .onboarding(.init()),
                    embedInNavigationView: true
                )]
                
            case .routeAction(_, .petOwnerMainTab):
                // TODO: 자동 로그인 시에 대한 처리.
                state.routes = [.root(
                    .petOwnerMainTab(.init()),
                    embedInNavigationView: true
                )]
                
            case .routeAction(_, .vetMainTab):
                // TODO: 자동 로그인 시에 대한 처리.
                state.routes = [.root(
                    .vetMainTab(.init()),
                    embedInNavigationView: true
                )]
                
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
