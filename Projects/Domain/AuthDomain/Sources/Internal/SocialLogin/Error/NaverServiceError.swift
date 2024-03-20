import Foundation

enum NaverServiceError: Error {
    case userIsNil
    case tokenIsNil
    case token
    case underlying(Error)
}
