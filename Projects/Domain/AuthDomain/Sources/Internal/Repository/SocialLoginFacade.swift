import Foundation

import Dependencies

extension DependencyValues {
    var socialLoginFacade: SocialLoginFacade {
        get { self[SocialLoginFacade.self] }
        set { self[SocialLoginFacade.self] = newValue }
    }
}

extension SocialLoginFacade: DependencyKey {
    static var liveValue: SocialLoginFacade = .init()
}

final class SocialLoginFacade {
    var currentSocialLoginMethod: SocialLoginMethod? {
        didSet {
            switch currentSocialLoginMethod {
            case .kakao:
                currentLoginService = kakaoLoginService
            case .naver:
                currentLoginService = naverLoginService
            case .apple:
                currentLoginService = appleLoginService
            case nil:
                currentLoginService = nil
            }
        }
    }
    
    private var currentLoginService: LoginService?
    
    private lazy var kakaoLoginService: LoginService = {
       return KakaoServiceAdapter()
    }()
    private lazy var naverLoginService: LoginService = {
       return NaverServiceAdapter()
    }()
    private lazy var appleLoginService: LoginService = {
        return KakaoServiceAdapter()
    }()
    
     func requestLogin() async throws -> SignIn {
        guard let currentLoginService else {
            throw LoginServiceError.loginServiceIsNil
        }
        
        return try await currentLoginService.requestLogin()
    }
    
     func requestMe() async throws -> User {
        guard let loginMethod = currentSocialLoginMethod else {
            throw LoginServiceError.loginMethodIsNil
        }
        guard [SocialLoginMethod.kakao, .naver].contains(loginMethod) else {
            throw LoginServiceError.checkLoginMethod(loginMethod)
        }
        guard let currentLoginService else {
            throw LoginServiceError.loginServiceIsNil
        }
        return try await currentLoginService.requestMe()
    }
    
     func requestLogout() async throws {
        try await currentLoginService?.requestLogout()
    }
}

extension SocialLoginFacade {
     func openURL(_ url: URL) {
        currentLoginService?.openURL(url)
    }
}
