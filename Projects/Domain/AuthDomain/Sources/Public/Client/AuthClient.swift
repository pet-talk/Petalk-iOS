import Foundation

import Dependencies

import Networking

extension DependencyValues {
    public var authClient: AuthClient {
        get { self[AuthClient.self] }
        set { self[AuthClient.self] = newValue }
    }
}

public struct AuthClient: Sendable {
    public var socialLogin: SocialLoginClient
    
    private var authenticate: @Sendable (
        _ loginMethod: SocialLoginMethod,
        _ accessToken: String
    ) async throws -> User
    
    public func requestLogin(loginMethod: SocialLoginMethod) async throws -> User {
        let signIn = try await socialLogin.requestLogin(loginMethod)
        let user = try await authenticate(loginMethod, signIn.accessToken)
        
        return user
    }
}

extension AuthClient: TestDependencyKey {
    public static let testValue = Self(
        socialLogin: .testValue,
        authenticate: { loginMethod, accessToken in
            return .init(
                userId: "test_auth_userid_\(loginMethod)_1",
                nickname: "test_auth_nickname_\(loginMethod)_🅾️",
                userAuthority: .petParent
            )
        }
    )
    public static var previewValue: AuthClient = testValue
}

extension AuthClient: DependencyKey {
    public static var liveValue: AuthClient = Self(
        socialLogin: .liveValue,
        authenticate: { loginMethod, accessToken in
            @Dependency(\.networking) var networking
            
            let dto: AuthResponseDTO = try await networking.request(
                AuthAPI.authenticate(
                    loginMethod: loginMethod,
                    accessToken: accessToken
                )
            )
            
            guard let user = dto.data?.toDomain() else {
                throw AuthError.notFoundUser
            }
            
            return user
        }
    )
}

enum AuthError: Error {
    case notFoundUser
}
