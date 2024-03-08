import Foundation

import Alamofire

import Logger

final class NetworkingLogger: EventMonitor {
    
    let queue: DispatchQueue = .init(label: Bundle.module.bundleIdentifier! + ".NetworkingLogger")
    
    func requestDidFinish(_ request: Request) {
        let log: String = """
⬆️ NETWORK REQUEST LOG
\(request.description)

URL: \(request.request?.url?.absoluteString ?? "")
Method: \(request.request?.httpMethod ?? "")
Headers: \(request.request?.allHTTPHeaderFields ?? [:])

Authorization: \(request.request?.headers["Authorization"] ?? "")
Body: \(request.request?.httpBody?.toPrettyPrintedString ?? "")
"""
        Log.debug(log)
    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        let log: String = """
⬇️ NETWORK RESPONSE LOG
URL: \(request.request?.url?.absoluteString ?? "")
Result: \(response.result)
StatusCode: \(response.response?.statusCode ?? 0)
Data: \(response.data?.toPrettyPrintedString ?? "")
"""
        Log.debug(log)
    }
}

private extension Data {
    var toPrettyPrintedString: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding: .utf8)
        else {
            return nil
        }
        return prettyPrintedString
    }
}
