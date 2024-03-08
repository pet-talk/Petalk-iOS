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
    
    @MainActor
    func requestLogin() async throws -> SignIn {
        Log.debug("Kakao Start")
        return try await withCheckedThrowingContinuation { [processLogin] continuation in
            if UserApi.isKakaoTalkLoginAvailable() {
                UserApi.shared.loginWithKakaoTalk { (token, error) in
                    processLogin(continuation, token, error)
                }
            } else {
                UserApi.shared.loginWithKakaoAccount { token, error in
                    processLogin(continuation, token, error)
                }
            }
        }
    }
    
    func requestMe() async throws -> User {
        Log.debug("Kakao Start")
        return try await withCheckedThrowingContinuation { continuation in
            UserApi.shared.me { user, error in
                if let error {
                    Log.error(error)
                    continuation.resume(throwing: error)
                    return
                } else if user == nil {
                    let error = LoginServiceError.userIsNil(.kakao)
                    Log.error(error)
                    continuation.resume(throwing: error)
                    return
                } else {
                    Log.debug("Kakao Success")
                    let user = User(
                        userId: user?.id?.string ?? "",
                        nickname: user?.kakaoAccount?.profile?.nickname ?? "",
                        userAuthority: .petOwner
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
                    Log.error(error)
                    continuation.resume(throwing: error)
                    return
                } else {
                    Log.debug("Kakao Success")
                    continuation.resume(returning: ())
                    return
                }
            }
        }
    }
    
    private func processLogin(
        continuation: CheckedContinuation<SignIn, Error>,
        token: OAuthToken?,
        error: Error?
    ) {
        if let error {
            Log.error(error)
            continuation.resume(throwing: error)
            return
        } else if token == nil {
            let error = LoginServiceError.tokenIsNil(.kakao)
            Log.error(error)
            continuation.resume(throwing: error)
            return
        } else {
            Log.debug("Kakao Success")
            let signIn = SignIn(
                accessToken: token!.accessToken,
                refreshToken: token!.refreshToken
            )
            continuation.resume(returning: signIn)
            return
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
