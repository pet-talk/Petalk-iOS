import Foundation

import Dependencies

extension DependencyValues {
    public var networking: Networking {
        get { self[Networking.self] }
        set { self[Networking.self] = newValue }
    }
}

extension Networking: DependencyKey {
    public static var liveValue: Networking = .init()
}
