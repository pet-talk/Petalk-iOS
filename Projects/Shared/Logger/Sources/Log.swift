import Foundation

public struct Log {
    
    private enum Level {
        case debug
        case info
        case error
        case warning
        
        var icon: String {
            switch self {
            case .debug:
                return "💬"
            case .info:
                return "ℹ️"
            case .error:
                return "‼️"
            case .warning:
                return "🔥"
            }
        }
    }
    
    private static var timeStamp: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return dateFormatter.string(from: Date())
    }
    
    public static func debug(
        _ items: Any...,
        separator: String = " ",
        terminator: String = "\n",
        file: String = #file,
        function: String = #function
    ) {
        let prefix = self.makeLogPrefix(
            file: file,
            function: function,
            level: .debug
        )
        
        print(prefix)
        print(items, separator: separator, terminator: terminator)
        print()
    }
    
    public static func info(
        _ items: Any...,
        separator: String = " ",
        terminator: String = "\n",
        file: String = #file,
        function: String = #function
    ) {
        let prefix = self.makeLogPrefix(
            file: file,
            function: function,
            level: .info
        )
        
        print(prefix)
        print(items, separator: separator, terminator: terminator)
        print()
    }
    
    public static func error(
        _ items: Any...,
        separator: String = " ",
        terminator: String = "\n",
        file: String = #file,
        function: String = #function
    ) {
        let prefix = self.makeLogPrefix(
            file: file,
            function: function,
            level: .error
        )
        
        print(prefix)
        print(items, separator: separator, terminator: terminator)
        print()
    }
    
    public static func warning(
        _ items: Any...,
        separator: String = " ",
        terminator: String = "\n",
        file: String = #file,
        function: String = #function
    ) {
        let prefix = self.makeLogPrefix(
            file: file,
            function: function,
            level: .warning
        )
        
        print(prefix)
        print(items, separator: separator, terminator: terminator)
        print()
    }
    
    private static func makeLogPrefix(
        file: String,
        function: String,
        level: Level
    ) -> String {
        let fileName = file.components(separatedBy: "/").last ?? ""
        
        return "[\(level.icon)][\(self.timeStamp)][\(fileName)][\(function)]"
    }
}
