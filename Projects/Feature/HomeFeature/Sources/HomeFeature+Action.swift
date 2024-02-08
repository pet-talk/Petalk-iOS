import ComposableArchitecture

extension HomeFeature {
  public enum Action: Equatable, BindableAction {
    case onAppear
    case binding(BindingAction<State>)
  }
}
