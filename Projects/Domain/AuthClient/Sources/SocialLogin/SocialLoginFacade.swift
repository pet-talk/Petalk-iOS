import Foundation

public final class SocialLoginFacade {
    
    private lazy var kakaoLoginService: LoginService = {
       return KakaoServiceAdapter()
    }()
    
    private var currentLoginService: LoginService?
    
    public func requestLogin(with loginMethod: SocialLoginMethod) async throws -> SignIn {
        guard let signIn = try await currentLoginService?.requestLogin() else {
            throw LoginServiceError.loginServiceIsNil(loginMethod)
        }
        
        return signIn
    }
    
    public func requestMe(with loginMethod: SocialLoginMethod) async throws -> User {
        guard [SocialLoginMethod.kakao, .naver].contains(loginMethod) else {
            throw LoginServiceError.checkLoginMethod(loginMethod)
        }
        
        guard let user = try await currentLoginService?.requestMe() else {
            throw LoginServiceError.loginServiceIsNil(loginMethod)
        }
        
        return user
    }
}

extension SocialLoginFacade {
    public func openURL(_ url: URL) {
        currentLoginService?.openURL(url)
    }
}
