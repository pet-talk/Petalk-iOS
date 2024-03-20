import Foundation

struct AuthResponseDTO: Decodable {
    let data: UserResponseDTO?
    let message: String
}

struct UserResponseDTO: Decodable {
    let userId: String?
    let nickname: String?
    let userAuthority: String?
}

extension UserResponseDTO {
    func toDomain() -> User? {
        guard
            let userId,
            let nickname,
            let userAuthority
        else {
            return nil
        }
        
        return .init(
            userId: userId,
            nickname: nickname,
            userAuthority: userAuthority.uppercased() == "VET" ? .vet : .petParent
        )
    }
}
