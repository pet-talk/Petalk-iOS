import Foundation

protocol LoginService: AnyObject {
    func requestLogin() async throws -> SignIn
    func requestMe() async throws -> User
    func requestLogout() async throws
    func openURL(_ url: URL)
}
