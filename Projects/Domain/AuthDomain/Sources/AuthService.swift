import ComposableArchitecture

protocol AuthService {
  func greeting() -> Effect<String>
}

final class AuthServiceLive: AuthService {
  func greeting() -> Effect<String> {
    .run { _ in
      print("Hello")
    }
  }
}

extension AuthService where Self == AuthServiceLive {
  static var live: Self {
    .init()
  }
}

#if DEBUG
struct AuthServiceMock: AuthService {
  let greetingEffect: Effect<String>
  
  func greeting() -> Effect<String> { greetingEffect }
}

extension AuthService where Self == AuthServiceMock {
  static func mock(
    greeting: Effect<String> = .none
  ) -> Self {
    .init(
      greetingEffect: greeting
    )
  }
  
  static var noop: Self {
    .init(
      greetingEffect: .none
    )
  }
  
  static var failing: Self {
    .init(
      greetingEffect: .run { _ in
        fatalError("Not implemented yet")
      }
    )
  }
}
#endif
