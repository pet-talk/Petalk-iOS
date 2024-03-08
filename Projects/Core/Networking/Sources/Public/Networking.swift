import Foundation

import Alamofire

import Logger

public final class Networking {
    
    private let session: Session
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    init(session: Session) {
        self.session = session
    }
    
    convenience init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        let eventLogger = NetworkingLogger()
        let session = Session(configuration: configuration, eventMonitors: [eventLogger])
        self.init(session: session)
    }
    
    public func request<T: Decodable>(_ service: APIService) async throws -> T {
        Log.debug("REQUEST Service : \(service)")
        let dataRequest = session
            .request(
                service.url,
                method: service.method,
                parameters: service.parameters,
                encoding: service.encoding,
                headers: service.headers
            )
//            .validate(statusCode: 200..<300)
        
        let dataTask = dataRequest
            .serializingDecodable(T.self, decoder: decoder)
        
        switch await dataTask.result {
        case .success(let value):
            return value
        case .failure(let error):
            Log.error(error)
            throw error
        }
    }
}
