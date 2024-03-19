import ComposableArchitecture

@Reducer(state: .equatable)
public enum ConsultingScreen {
    case temp(ConsultingFeature)
    
    public static var body: some ReducerOf<Self> {
        Scope(state: \.temp, action: \.temp) {
            ConsultingFeature()
        }
    }
}
