import Foundation

import Alamofire

public typealias HTTPMethod = Alamofire.HTTPMethod
public typealias Parameters = Alamofire.Parameters
public typealias HTTPHeaders = Alamofire.HTTPHeaders
public typealias ParameterEncoding = Alamofire.ParameterEncoding
public typealias URLEncoding = Alamofire.URLEncoding
public typealias JSONEncoding = Alamofire.JSONEncoding

public protocol APIService {
    var baseURL: URL { get }
    var path: String { get }
    var apiVersion: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}

public extension APIService {
    var baseURL: URL {
        return URL(string: (Bundle.module.infoDictionary?["BASE_URL"] as? String ?? ""))!
    }
    var apiVersion: String {
        return "/api"
    }
    var url: URL {
        let apiPath = apiVersion + path
        return baseURL.appendingPathComponent(apiPath)
    }
    var encoding: ParameterEncoding {
        [HTTPMethod.get, .head, .delete].contains(method)
        ? URLEncoding.default
        : JSONEncoding.default
    }
}

private class BundleFinder {}

extension Foundation.Bundle {
    static let module = Bundle(for: BundleFinder.self)
}
