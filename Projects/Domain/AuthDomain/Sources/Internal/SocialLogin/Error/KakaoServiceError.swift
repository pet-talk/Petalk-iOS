import Foundation

enum KakaoServiceError: Error {
    case userIsNil
    case tokenIsNil
    case token
    case underlying(Error)
}
