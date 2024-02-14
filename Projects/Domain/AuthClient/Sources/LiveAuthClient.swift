import Foundation
import Dependencies
import AuthClientInterface

extension AuthClient: DependencyKey {
    public static let liveValue = Self(
        greeting: { name in
            // Delay the task by 1 second
            try await Task.sleep(nanoseconds: 1_000_000_000)
            
            return "Hello, \(name)"
        }, requestLogin: {
            return .init(userId: "", nickname: "", userAuthority: "")
        }
    )
}
