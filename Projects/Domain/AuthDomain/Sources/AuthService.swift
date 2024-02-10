//
//  AuthService.swift
//  AuthDomainInterface
//
//  Created by Oh Sangho on 2/10/24.
//  Copyright © 2024 com.petalk. All rights reserved.
//

import ComposableArchitecture

protocol AuthService {
  func greeting() -> Effect<String, Never>
}

final class AuthServiceLive: AuthService {
  func greeting() -> Effect<String, Never> {
    .fireAndForget {
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
  let greetingEffect: Effect<String, Never>

  func greeting() -> Effect<String, Never> { greetingEffect }
}

extension AuthService where Self == AuthServiceMock {
  static func mock(
    greeting: Effect<String, Never> = .none
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
      greetingEffect: .fireAndForget {
        fatalError("Not implemented yet")
      }
    )
  }
}
#endif
