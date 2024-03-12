import Foundation

public struct UserDefaultClient {
    enum Key: String {
        case userId
        case nickname
        case userAuthority
    }
    
    @UserDefault(key: Key.userId.rawValue)
    public static var userId: String?
    
    @UserDefault(key: Key.nickname.rawValue)
    public static var nickname: String?
    
    @UserDefault(key: Key.userAuthority.rawValue)
    public static var userAuthority: String?
    
    public static func deleteUserInfo() {
        userId = nil
        nickname = nil
        userAuthority = nil
    }
}
