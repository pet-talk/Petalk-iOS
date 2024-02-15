import Foundation

protocol LoginService {
    func requestLogin() async throws -> SignIn
    func requestMe() async throws -> User
    func requestLogout() async throws
}
