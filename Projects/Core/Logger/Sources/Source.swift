import OSLog
import LoggerInterface

typealias OSLogger = os.Logger

final class LoggerImpl: LoggerInterface.Logger {
    private let logger: OSLogger
    private let configuration: LoggerConfiguration
    
    init(configuration: LoggerConfiguration) {
        self.configuration = configuration
//        logger.log(level: configuration.level.osLogType, "")
//        log = OSLog(subsystem: subsystem, category: category)
        
        logger = OSLogger(
            subsystem: Bundle.main.bundleIdentifier!,
            category: ""
        )
    }
    
    func log(_ message: String, level: LoggerInterface.LogLevel) {
        let type: OSLogType
        switch level {
        case .debug:
            type = .debug
        case .info:
            type = .info
        case .warning:
            type = .default
        case .error:
            type = .error
        }
        
        logger.log(level: type, "\(message)")
//        os_log("%{public}@", log: logger, type: type, message)
    }
}
