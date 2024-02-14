import Foundation

public enum KakaoServiceError: Error {
    case authFailed(reason: KakaoServiceFailedReason)
    case meFailed(reason: KakaoServiceFailedReason)
}

public enum KakaoServiceFailedReason: String {
    case authTokenIsNil
    case userIsNil
}
