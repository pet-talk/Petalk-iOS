import Foundation

public struct User {
    public let userId: String?
    public let nickname: String?
    public let userAuthority: String?
    
    public init(
        userId: String?,
        nickname: String?,
        userAuthority: String?
    ) {
        self.userId = userId
        self.nickname = nickname
        self.userAuthority = userAuthority
    }
}
