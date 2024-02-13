import Foundation
import Dependencies
import DependenciesMacros

@DependencyClient
public struct AuthClient: Sendable {
    public var greeting: @Sendable (_ name: String) async throws -> String
}

extension AuthClient: TestDependencyKey {
    public static let testValue = Self(
        greeting: { name in
            // Delay the task by 1 second
            try await Task.sleep(nanoseconds: 1_000_000_000)
            
            return "Hello, \(name)"
        }
    )
}

extension DependencyValues {
    public var authClient: AuthClient {
        get { self[AuthClient.self] }
        set { self[AuthClient.self] = newValue }
    }
}
