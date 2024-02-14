import Foundation
import Combine

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

import AuthClientInterface
import FoundationUtility

typealias SignIn = AuthClientInterface.SignIn
typealias User = AuthClientInterface.User

protocol LoginService {
    func requestLogin() async throws -> SignIn
}

final class KakaoServiceAdapter: LoginService {
    func requestLogin() async throws -> SignIn {
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
        return try await withCheckedThrowingContinuation { continuation in
            UserApi.shared.me { user, error in
                if let error {
                    print(error)
                    continuation.resume(throwing: error)
                    return
                } else if user == nil {
                    let error = KakaoServiceError.meFailed(reason: .userIsNil)
                    print(error)
                    continuation.resume(throwing: error)
                    return
                } else {
                    print("me() success.")
                    
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
            print(error)
            continuation.resume(throwing: error)
            return
        } else if token == nil {
            let error = KakaoServiceError.authFailed(reason: .authTokenIsNil)
            print(error)
            continuation.resume(throwing: error)
            return
        } else {
            print("loginWithKakaoTalk() success.")
            let signIn = SignIn(
                accessToken: token!.accessToken,
                refreshToken: token!.refreshToken
            )
            continuation.resume(returning: signIn)
            return
        }
    }
}
