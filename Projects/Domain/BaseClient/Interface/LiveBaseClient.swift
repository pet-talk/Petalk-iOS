import Foundation
import Dependencies
import BaseClient

extension BaseClient: DependencyKey {
    public static let liveValue = Self(
        greeting: { name in
            // Delay the task by 1 second
            try await Task.sleep(nanoseconds: 1_000_000_000)
            
            return "Hello, \(name)"
        }
    )
}
