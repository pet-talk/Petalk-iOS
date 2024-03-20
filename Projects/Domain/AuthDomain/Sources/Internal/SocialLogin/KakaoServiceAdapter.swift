import Foundation

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

import FoundationUtility
import Logger

extension SocialLoginMethod {
    fileprivate static let kakaoAppKey: String = Bundle.main.string(for: "KakaoAppKey")
}

final class KakaoServiceAdapter: LoginService {
    
    init() {
        KakaoSDK.initSDK(appKey: SocialLoginMethod.kakaoAppKey)
    }
    
    func requestLogin() async throws -> SignIn {
        do {
            if try await checkToken() != nil, let token = Auth.shared.tokenManager.getToken() {
                let signIn = SignIn(accessToken: token.accessToken, refreshToken: token.refreshToken)
                return signIn
            } else {
                let signIn = try await performLogin()
                return signIn
            }
        } catch {
            let signIn = try await performLogin()
            return signIn
        }
    }
    
    func requestMe() async throws -> User {
        Log.debug("Kakao Start")
        return try await withCheckedThrowingContinuation { continuation in
            UserApi.shared.me { user, error in
                if let error {
                    Log.error(KakaoServiceError.underlying(error))
                    continuation.resume(throwing: KakaoServiceError.underlying(error))
                    return
                } else if user == nil {
                    Log.error(KakaoServiceError.userIsNil)
                    continuation.resume(throwing: KakaoServiceError.userIsNil)
                    return
                } else {
                    Log.debug("Kakao Success")
                    let user = User(
                        userId: user?.id?.string ?? "",
                        nickname: user?.kakaoAccount?.profile?.nickname ?? "",
                        userAuthority: .petParent
                    )
                    continuation.resume(returning: user)
                    return
                }
            }
        }
    }
    
    func requestLogout() async throws {
        Log.debug("Kakao Start")
        return try await withCheckedThrowingContinuation { continuation in
            UserApi.shared.logout { error in
                if let error {
                    Log.error(KakaoServiceError.underlying(error))
                    continuation.resume(throwing: KakaoServiceError.underlying(error))
                    return
                } else {
                    Log.debug("Kakao Success")
                    continuation.resume(returning: ())
                    return
                }
            }
        }
    }
}

extension KakaoServiceAdapter {
    func openURL(_ url: URL) {
        if AuthApi.isKakaoTalkLoginUrl(url) {
            _ = AuthController.handleOpenUrl(url: url)
        }
    }
}

private extension KakaoServiceAdapter {
    private func checkToken() async throws -> AccessTokenInfo? {
        return try await withCheckedThrowingContinuation { continuation in
            if AuthApi.hasToken() {
                UserApi.shared.accessTokenInfo { token, error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else {
                        continuation.resume(returning: token)
                    }
                }
            } else {
                continuation.resume(returning: nil)
            }
        }
    }
    
    @MainActor
    private func performLogin() async throws -> SignIn {
        Log.debug("Kakao Start")
        return try await withCheckedThrowingContinuation { [processLogin] continuation in
            if UserApi.isKakaoTalkLoginAvailable() {
                UserApi.shared.loginWithKakaoTalk { (token, error) in
                    let result = processLogin(continuation, token, error)
                    continuation.resume(with: result)
                }
            } else {
                UserApi.shared.loginWithKakaoAccount { token, error in
                    let result = processLogin(continuation, token, error)
                    continuation.resume(with: result)
                }
            }
        }
    }
    
    private func processLogin(
        continuation: CheckedContinuation<SignIn, Error>,
        token: OAuthToken?,
        error: Error?
    ) -> Result<SignIn, Error> {
        if let error {
            Log.error(KakaoServiceError.underlying(error))
            return .failure(KakaoServiceError.underlying(error))
        } else if token == nil {
            Log.error(KakaoServiceError.tokenIsNil)
            return .failure(KakaoServiceError.tokenIsNil)
        } else {
            Log.debug("Kakao Success")
            let signIn = SignIn(
                accessToken: token!.accessToken,
                refreshToken: token!.refreshToken
            )
            return .success(signIn)
        }
    }
}
