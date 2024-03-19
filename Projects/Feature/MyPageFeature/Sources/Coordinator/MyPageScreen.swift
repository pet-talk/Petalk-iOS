import ComposableArchitecture

@Reducer(state: .equatable)
public enum MyPageScreen {
    case temp(MyPageFeature)
    
    public static var body: some ReducerOf<Self> {
        Scope(state: \.temp, action: \.temp) {
            MyPageFeature()
        }
    }
}
