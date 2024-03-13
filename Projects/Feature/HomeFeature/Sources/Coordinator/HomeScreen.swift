import ComposableArchitecture

@Reducer(state: .equatable)
public enum HomeScreen {
    case temp(HomeFeature)
    
    public static var body: some ReducerOf<Self> {
        Scope(state: \.temp, action: \.temp) {
            HomeFeature()
        }
    }
}
