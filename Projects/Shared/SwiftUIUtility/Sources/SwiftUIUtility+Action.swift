import ComposableArchitecture

extension SwiftUIUtility {
  public enum Action: Equatable, BindableAction {
    case onAppear
    case binding(BindingAction<State>)
  }
}
