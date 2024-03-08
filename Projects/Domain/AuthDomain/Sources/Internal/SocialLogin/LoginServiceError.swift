import Foundation

enum LoginServiceError: Error {
    case tokenIsNil(SocialLoginMethod)
    case userIsNil(SocialLoginMethod)
    case loginMethodIsNil
    case loginServiceIsNil
    case checkLoginMethod(SocialLoginMethod)
}

extension LoginServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .tokenIsNil(let socialLoginMethod):
            return "\(socialLoginMethod.rawValue) - 토큰 값이 없음."
        case .userIsNil(let socialLoginMethod):
            return "\(socialLoginMethod.rawValue) - 유저 값이 없음."
        case .loginMethodIsNil:
            return "로그인 메소드가 설정되지 않음."
        case .loginServiceIsNil:
            return "LoginFacade에 currentLoginService가 설정되어있지 않음."
        case .checkLoginMethod(let socialLoginMethod):
            return "\(socialLoginMethod) - 로그인 메소드 확인 필요."
        }
    }
}
