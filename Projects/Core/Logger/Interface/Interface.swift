// This is for Tuist

public enum LogLevel {
    case info
    case debug
    case error
    case warning
}

public struct LoggerConfiguration {
    public let category: String
    public let level: LogLevel
}

public protocol Logger {
    func log(_ message: String, level: LogLevel)
}
