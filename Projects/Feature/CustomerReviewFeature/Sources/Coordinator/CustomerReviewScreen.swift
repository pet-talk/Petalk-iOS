import ComposableArchitecture

@Reducer(state: .equatable)
public enum CustomerReviewScreen {
    case temp(CustomerReviewFeature)
    
    public static var body: some ReducerOf<Self> {
        Scope(state: \.temp, action: \.temp) {
            CustomerReviewFeature()
        }
    }
}
