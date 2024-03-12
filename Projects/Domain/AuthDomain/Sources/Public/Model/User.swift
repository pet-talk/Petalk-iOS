import Foundation

public struct User: Hashable {
    public enum Authority: String, Hashable {
        case petOwner
        case vet
    }
    
    public let userId: String
    public let nickname: String
    public var userAuthority: Authority
    
    public init(
        userId: String,
        nickname: String,
        userAuthority: Authority
    ) {
        self.userId = userId
        self.nickname = nickname
        self.userAuthority = userAuthority
    }
}
