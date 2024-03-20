import Foundation

public struct UserDefaultClient {
    public enum Key: String {
        case loggedInUserAuthority
        case loggedInMethod
    }
    
    @UserDefault(key: .loggedInUserAuthority)
    public static var loggedInUserAuthority: String?
    
    @UserDefault(key: .loggedInMethod)
    public static var loggedInMethod: String?
    
    public static func deleteLoggedInInfo() {
        loggedInUserAuthority = nil
        loggedInMethod = nil
    }
}
