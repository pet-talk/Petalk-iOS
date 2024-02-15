import Foundation
import Combine

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

import AuthClientInterface
import FoundationUtility
import Logger

typealias SignIn = AuthClientInterface.SignIn
typealias User = AuthClientInterface.User

protocol LoginService {
    func requestLogin() async throws -> SignIn
    func requestMe() async throws -> User
}

final class KakaoServiceAdapter: LoginService {
    func requestLogin() async throws -> SignIn {
        Log.debug(#function, state: .REQUEST)
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            if UserApi.isKakaoTalkLoginAvailable() {
                UserApi.shared.loginWithKakaoTalk { (token, error) in
                    self?.processLogin(continuation: continuation, token: token, error: error)
                }
            } else {
                UserApi.shared.loginWithKakaoAccount { token, error in
                    self?.processLogin(continuation: continuation, token: token, error: error)
                }
            }
        }
    }
    
    func requestMe() async throws -> User {
        Log.debug(#function, state: .REQUEST)
        return try await withCheckedThrowingContinuation { continuation in
            UserApi.shared.me { user, error in
                if let error {
                    Log.error(error)
                    continuation.resume(throwing: error)
                    return
                } else if user == nil {
                    let error = KakaoServiceError.meFailed
                    Log.error(error)
                    continuation.resume(throwing: error)
                    return
                } else {
                    Log.debug(#function, "SUCCESS", state: .COMPLETE)
                    let user = User(
                        userId: user?.id?.string,
                        nickname: user?.kakaoAccount?.profile?.nickname,
                        userAuthority: ""
                    )
                    continuation.resume(returning: user)
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
            let error = KakaoServiceError.meFailed
            Log.error(error)
            continuation.resume(throwing: error)
            return
        } else {
            Log.debug(#function, "SUCCESS", state: .COMPLETE)
            let signIn = SignIn(
                accessToken: token!.accessToken,
                refreshToken: token!.refreshToken
            )
            continuation.resume(returning: signIn)
            return
        }
    }
}
