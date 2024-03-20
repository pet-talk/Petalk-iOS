import Foundation

import Dependencies
import DependenciesMacros

@DependencyClient
public struct SocialLoginClient: Sendable {
    public var requestLogin: @Sendable (_ loginMethod: SocialLoginMethod) async throws -> SignIn
    public var requestMe: @Sendable () async throws -> User
    public var requestLogout: @Sendable () async throws -> Void
    public var openURL: @Sendable (_ url: URL) -> Void
}

extension SocialLoginClient: TestDependencyKey {
    public static var testValue: SocialLoginClient = Self(
        requestLogin: { loginMethod in
            return .init(accessToken: "testAccessToken", refreshToken: "testRefreshToken")
        },
        requestMe: {
            return .init(
                userId: "test_social_userid_1",
                nickname: "test_social_nickname_❌",
                userAuthority: .petParent
            )
        },
        requestLogout: {
            return
        },
        openURL: { url in
            return
        }
    )
    public static var previewValue: SocialLoginClient = testValue
}

extension SocialLoginClient: DependencyKey {
    public static var liveValue: SocialLoginClient = Self(
        requestLogin: { loginMethod in
            @Dependency(\.socialLoginFacade) var loginFacade
            loginFacade.currentSocialLoginMethod = loginMethod
            return try await loginFacade.requestLogin()
        },
        requestMe: {
            @Dependency(\.socialLoginFacade) var loginFacade
            return try await loginFacade.requestMe()
        },
        requestLogout: {
            @Dependency(\.socialLoginFacade) var loginFacade
            return try await loginFacade.requestLogout()
        },
        openURL: { url in
            @Dependency(\.socialLoginFacade) var loginFacade
            return loginFacade.openURL(url)
        }
    )
}
