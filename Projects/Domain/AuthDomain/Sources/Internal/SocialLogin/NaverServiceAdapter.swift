import Foundation
import Combine

import NaverThirdPartyLogin
import Dependencies

import FoundationUtility
import Logger

extension SocialLoginMethod {
    fileprivate static let naverClientKey: String = Bundle.main.string(for: "NaverClientKey")
    fileprivate static let naverClientSecret: String = Bundle.main.string(for: "NaverClientSecret")
    
    fileprivate var urlScheme: String {
        switch self {
        case .naver:
            #if DEV
            return "naverlogin"
            #elseif STAGE
            return "naverlogin"
            #else
            return "naverlogin"
            #endif
        case .kakao, .apple:
            return ""
        }
    }
}

final class NaverServiceAdapter: NSObject, LoginService {
    
    @Dependency(\.networking) var networking
    private let loginConnection: NaverThirdPartyLoginConnection
    private var accessToken: String? { loginConnection.accessToken }
    private var refreshToken: String? { loginConnection.refreshToken }
    private var connection: ((Result<(), Error>) -> Void)?
    
    override init() {
        let instance = NaverThirdPartyLoginConnection.getSharedInstance()!
        
        // 네이버 앱으로 인증하는 방식 활성화
        instance.isNaverAppOauthEnable = true
        // SafariViewController에서 인증하는 방식 활성화
        instance.isInAppOauthEnable = true
        // 인증 화면을 아이폰의 세로모드에서만 적용
        instance.isOnlyPortraitSupportedInIphone()
        
        instance.serviceUrlScheme = SocialLoginMethod.naver.urlScheme
        instance.consumerKey = SocialLoginMethod.naverClientKey
        instance.consumerSecret = SocialLoginMethod.naverClientSecret
        instance.appName = Bundle.main.string(for: "CFBundleName")
        
        loginConnection = instance
        super.init()
        loginConnection.delegate = self
    }
    
    @MainActor
    func requestLogin() async throws -> SignIn {
        Log.debug("Naver Start")
        loginConnection.requestThirdPartyLogin()
        
        return try await withCheckedThrowingContinuation { continuation in
            connection = { result in
                switch result {
                case .success:
                    let accessToken = self.accessToken ?? ""
                    let refreshToken = self.refreshToken ?? ""
                    let signIn = SignIn(accessToken: accessToken, refreshToken: refreshToken)
                    
                    continuation.resume(returning: signIn)
                    
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func requestMe() async throws -> User {
        Log.debug("Naver Start")
        let accessToken = accessToken ?? ""
        
        let loginResponse: NaverLoginResponseDTO = try await networking.request(
            NaverLoginAPI.me(accessToken)
        )
        let response = loginResponse.response
        let user = response.toDomain(authority: .petOwner)
        
        return user
    }
    
    func requestLogout() async throws {
        await loginConnection.resetToken()
    }
    
    func openURL(_ url: URL) {
        let result = loginConnection.receiveAccessToken(url)
        let isFailure: Bool = result.rawValue != 0
        if isFailure {
            struct NaverLoginError: Error {
                let type: THIRDPARTYLOGIN_RECEIVE_TYPE
            }
            connection?(.failure(NaverLoginError(type: result)))
        }
    }
}

extension NaverServiceAdapter: NaverThirdPartyLoginConnectionDelegate {
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        Log.debug("Naver Success - accessToken: \(String(describing: accessToken)), refreshToken: \(String(describing: refreshToken))")
        
        connection?(.success(()))
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        Log.debug("Naver Success - accessToken: \(String(describing: accessToken)), refreshToken: \(String(describing: refreshToken))")
        
        connection?(.success(()))
    }
    
    func oauth20ConnectionDidFinishDeleteToken() {
        Log.debug("Naver Success - accessToken: \(String(describing: accessToken)), refreshToken: \(String(describing: refreshToken))")
        
        connection?(.success(()))
    }
    
    func oauth20Connection(
        _ oauthConnection: NaverThirdPartyLoginConnection,
        didFailWithError error: any Error
    ) {
        Log.error(error, "accessToken: \(String(describing: oauthConnection.accessToken)), refreshToken: \(String(describing: oauthConnection.refreshToken))")
        
        connection?(.failure(error))
    }
}
