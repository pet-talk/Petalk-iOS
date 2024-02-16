import Foundation

public enum LoginServiceError: Error {
    case tokenIsNil(SocialLoginMethod)
    case userIsNil(SocialLoginMethod)
    case loginServiceIsNil(SocialLoginMethod)
    case checkLoginMethod(SocialLoginMethod)
}
