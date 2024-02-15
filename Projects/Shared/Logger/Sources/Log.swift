import Foundation
import OSLog

public struct Log {
    public enum FuncState: String {
        case NONE = ""
        case REQUEST
        case COMPLETE
    }
    
    enum Level {
        case debug
        case info
        case error
        case warning
        
        fileprivate var osLogType: OSLogType {
            switch self {
            case .debug:
                return .debug
            case .info:
                return .info
            case .error:
                return .error
            case .warning:
                return .default
            }
        }
    }
    
    private static var category: String {
        String(describing: Self.self)
    }
    
    private static func log(_ messages: Any..., level: Level) {
        let logger = Logger(subsystem: OSLog.subsystem, category: category)
        let logMessage: String = messages.map({ String(describing: $0) }).joined(separator: " ")
        switch level {
        case .debug:
            logger.debug("\(logMessage, privacy: .public)")
        case .info:
            logger.info("\(logMessage, privacy: .public)")
        case .error:
            logger.error("\(logMessage, privacy: .public)")
        case .warning:
            logger.log("\(logMessage, privacy: .public)")
        }
    }
}

// MARK: - utils

extension Log {
    public static func debug(_ messages: Any..., state: Log.FuncState = .NONE) {
        log(state.rawValue, messages, level: .debug)
    }
    
    public static func info(_ messages: Any...) {
        log(messages, level: .info)
    }
    
    public static func warning(_ messages: Any...) {
        log(messages, level: .warning)
    }
    
    public static func error(_ messages: Any...) {
        log(messages, level: .error)
    }
}

extension OSLog {
    static let subsystem = Bundle.main.bundleIdentifier!
}
