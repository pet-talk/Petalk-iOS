import ComposableArchitecture

@Reducer(state: .equatable)
public enum ConsultationListScreen {
    case temp(ConsultationListFeature)
    
    public static var body: some ReducerOf<Self> {
        Scope(state: \.temp, action: \.temp) {
            ConsultationListFeature()
        }
    }
}
