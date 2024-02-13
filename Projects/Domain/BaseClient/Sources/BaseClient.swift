import Foundation
import Dependencies
import DependenciesMacros

@DependencyClient
public struct BaseClient: Sendable {
    public var greeting: @Sendable (_ name: String) async thrwos -> String
}

extension BaseClient: TestDependencyKey {
    public static let testValue = Self()
}

extension DependencyValues {
    public var authenticationClient: BaseClient {
        get { self[BaseClient.self] }
        set { self[BaseClient.self] = newValue }
    }
}
