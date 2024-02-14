// This is for Tuist
// 여기서 Domain에서 사용할 수 있게 pacade 인터페이스 구현.

import Foundation
import Dependencies
import DependenciesMacros

public struct SocialLoginClient: Sendable {
    var openURL: @Sendable (_ url: URL) async throws -> Void
}

extension SocialLoginClient: TestDependencyKey {
    public static let testValue = Self(
        openURL: { url in
            
        }
    )
}

extension DependencyValues {
    public var socialLoginClient: SocialLoginClient {
        get { self[SocialLoginClient.self] }
        set { self[SocialLoginClient.self] = newValue }
    }
}
