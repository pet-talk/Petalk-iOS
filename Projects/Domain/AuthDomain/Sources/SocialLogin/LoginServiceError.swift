import Foundation

import AuthDomainInterface

public enum LoginServiceError: Error {
    case tokenIsNil(AuthDomainInterface.SocialLoginMethod)
    case userIsNil(AuthDomainInterface.SocialLoginMethod)
    case loginServiceIsNil(AuthDomainInterface.SocialLoginMethod)
    case checkLoginMethod(AuthDomainInterface.SocialLoginMethod)
}

extension LoginServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .tokenIsNil(let socialLoginMethod):
            return "\(socialLoginMethod.rawValue) - 토큰 값이 없음."
        case .userIsNil(let socialLoginMethod):
            return "\(socialLoginMethod.rawValue) - 유저 값이 없음."
        case .loginServiceIsNil(let socialLoginMethod):
            return "\(socialLoginMethod.rawValue) - LoginFacade에 currentLoginService가 설정되어있지 않음."
        case .checkLoginMethod(let socialLoginMethod):
            return "\(socialLoginMethod) - 로그인 메소드 확인 필요."
        }
    }
}
