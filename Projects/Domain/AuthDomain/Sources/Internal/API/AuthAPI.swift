import Foundation

import Networking

enum AuthAPI {
    case authenticate(loginMethod: SocialLoginMethod, accessToken: String)
}

extension AuthAPI: APIService {
    var path: String {
        switch self {
        case let .authenticate(loginMethod, _):
            return "/auth/authenticate/\(loginMethod.rawValue)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .authenticate:
            return .post
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case let .authenticate(_, accessToken):
            return [
                "accessToken": accessToken,
                "tokenType": "bearer"
            ]
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .authenticate:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .authenticate:
            return JSONEncoding.default
        }
    }
}
