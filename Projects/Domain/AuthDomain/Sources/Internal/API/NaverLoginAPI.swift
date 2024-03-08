import Foundation

import Networking

enum NaverLoginAPI {
    case me(_ accessToken: String)
}

extension NaverLoginAPI: APIService {
    var baseURL: URL {
        return URL(string: "https://openapi.naver.com")!
    }
    
    var apiVersion: String {
        switch self {
        case .me:
            return "/v1"
        }
    }
    
    var path: String {
        switch self {
        case .me:
            return "/nid/me"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .me:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .me:
            return nil
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case let .me(accessToken):
            return [
                "Authorization": "Bearer \(accessToken)"
            ]
        }
    }
}
