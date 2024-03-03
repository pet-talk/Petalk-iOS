import Foundation

import Dependencies

import AuthDomainInterface

extension AuthClient: DependencyKey {
    public static let liveValue = AuthClient(
        greeting: { name in
            // Delay the task by 1 second
            try await Task.sleep(nanoseconds: 1_000_000_000)
            
            return "Hello, \(name)"
        }, requestLogin: { loginMethod in
//            let loginService: LoginService
//            switch loginMethod {
//            case .kakao:
//                loginService = KakaoServiceAdapter()
//            case .naver:
//                break
//            case .apple:
//                break
//            }
            
//            let signIn = try await loginService.requestLogin()
//            let user = try await loginService.requestMe()
//            return user
            
            return .init(userId: "", nickname: "", userAuthority: "")
        }
    )
}
