import ComposableArchitecture

extension CombineUtility {
  public enum Action: Equatable, BindableAction {
    case onAppear
    case binding(BindingAction<State>)
  }
}
